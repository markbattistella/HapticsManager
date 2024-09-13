//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

#if os(iOS)

import SwiftUI
import OSLog
import SimpleLogger
import DefaultsKit

// MARK: - Type Aliases

/// A typealias for the feedback style used by `UIImpactFeedbackGenerator`.
public typealias FBStyle = UIImpactFeedbackGenerator.FeedbackStyle

/// A typealias for the feedback type used by `UINotificationFeedbackGenerator`.
public typealias FBType = UINotificationFeedbackGenerator.FeedbackType

// MARK: - Logger Category Extension

extension LoggerCategory {

    /// A custom category for package haptic management.
    internal static let packageHapticsManager = LoggerCategory("PackageHapticsManager")
}

// MARK: - HapticsManager Class

/// A manager responsible for handling haptic feedback throughout the iOS application.
///
/// This class provides a singleton instance that ensures consistent haptic feedback behavior
/// across the app based on user preferences and device capabilities.
@MainActor
internal final class HapticsManager: Sendable {

    /// The shared instance of `HapticsManager` for app-wide use.
    internal static let shared = HapticsManager()

    /// User defaults object for storing user settings.
    private let defaults = UserDefaults.standard

    /// A generator for producing notification-style haptic feedback.
    @MainActor
    private let notificationFeedback = UINotificationFeedbackGenerator()

    /// A cache of `UIImpactFeedbackGenerator` instances, indexed by their feedback style.
    private lazy var impactFeedbackGenerators: [FBStyle: UIImpactFeedbackGenerator] = [:]

    /// A private property that tracks whether haptic feedback is enabled app-wide.
    private var _appWideEnabled: Bool

    /// The current settings for managing haptic feedback.
    private var settings: HapticSettings

    /// A logger instance dedicated to haptics to handle and filter log outputs.
    private let logger = Logger(category: .packageHapticsManager)

    /// A private queue used to synchronize access to settings to ensure thread safety.
    private let settingsQueue = DispatchQueue(
        label: "com.markbattistella.hapticsManager",
        attributes: .concurrent
    )

    /// Indicates whether haptic feedback is enabled for the application, synchronized for
    /// thread safety.
    internal var appWideEnabled: Bool { settingsQueue.sync { _appWideEnabled } }

    /// Counter for logging occurrences in production mode.
    private var productionModeLogCount = 0

    /// Counter for logging occurrences of user defaults disabling haptics.
    private var userDefaultsDisabledLogCount = 0

    /// The threshold for limiting log messages.
    private let logThreshold = 5

    /// The last time a log was printed.
    private var lastLogTime: Date?

    /// The last known state of app-wide haptic enablement.
    private var lastAppWideEnabledState: Bool?

    /// The last known state of haptic enablement.
    private var lastHapticEnabledState: Bool?

    /// The last known state of logging enablement.
    private var lastKnownLoggingState: Bool?

    /// The last time a "skip log" message was printed.
    private var lastSkipLogTime: Date?

    // MARK: - Initializers

    /// Initializes the `HapticsManager` with default settings.
    ///
    /// This initializer sets up the manager with default `UserDefaultsHapticSettings` and begins
    /// observing changes to user defaults to update settings in real-time.
    private init() {
        self.settings = HapticUserDefaultsSettings(
            hapticEnabledKey: HapticUserDefaultKeys.hapticEffectsEnabled,
            hapticLoggingEnabledKey: HapticUserDefaultKeys.hapticLoggingEnabled
        )
        self._appWideEnabled = settings.isEnabled
        self.observeUserDefaultsChanges()
        self.logInitialStatus()
    }

    /// Deinitializes the `HapticsManager`, removing any observers to prevent memory leaks.
    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: UserDefaults.didChangeNotification,
            object: nil
        )
    }
}

// MARK: - Setup Methods

extension HapticsManager {

    /// Sets up observation of changes to user defaults to update the `appWideEnabled` property.
    ///
    /// Observes `UserDefaults.didChangeNotification` on a background queue to respond to changes
    /// in user preferences for haptic feedback.
    private func observeUserDefaultsChanges() {
        NotificationCenter.default.addObserver(
            forName: UserDefaults.didChangeNotification,
            object: nil,
            queue: OperationQueue()
        ) { [self] _ in
            Task { @MainActor in
                self.updateAppWideEnabled()
                self.logAppWideStatusChange()
            }
        }
    }

    /// Updates the `appWideEnabled` property based on the current settings in a thread-safe manner.
    ///
    /// This method ensures that changes to the haptic settings are reflected immediately
    /// across the application when user preferences are updated.
    private func updateAppWideEnabled() {
        _appWideEnabled = settings.isEnabled
    }
}

// MARK: - Logging Methods

extension HapticsManager {

    /// Determines whether logging should occur based on the current settings and build configuration.
    ///
    /// - Returns: `true` if logging is enabled and the build is in debug mode; otherwise, `false`.
    private func shouldLog() -> Bool {
#if DEBUG
        return settings.isLoggingEnabled
#else
        return false
#endif
    }

    /// Logs the initial status when the manager initializes.
    private func logInitialStatus() {
        guard shouldLog() else { return }
        logSettings(mode: .complete())
    }

    /// Logs changes in the app-wide enabled status.
    private func logAppWideStatusChange() {
        guard shouldLog() else { return }
        settingsQueue.sync {
            logger.info("App-wide enabled status changed: \(self._appWideEnabled)")
        }
    }

    /// Logs the current settings based on the specified logging mode.
    ///
    /// - Parameter mode: The mode in which to log settings, either `.smart` or `.complete`.
    internal func logSettings(mode: LoggingMode = .smart()) {
        guard shouldLog() else {
            logDisabledHapticMessage()
            return
        }
        settingsQueue.sync {
            logDetailedSettings(mode: mode)
        }
    }

    /// Logs detailed settings based on the provided logging mode, including thresholds for
    /// skipping logs and determining when to log changes in haptic settings.
    ///
    /// - Parameter mode: The logging mode which specifies how detailed the logging should be.
    private func logDetailedSettings(mode: LoggingMode) {
        let currentTime = Date()

        switch mode {
            case .smart(let skipLogThreshold, let logThreshold):
                if shouldSkipLog(currentTime: currentTime, skipLogThreshold: skipLogThreshold) {
                    return
                }

                if shouldLogChanges(currentTime: currentTime, logThreshold: logThreshold) {
                    updateLoggingStates(currentTime: currentTime)
                } else {
                    resetLoggingStates()
                }

            case .complete(let logThreshold):
                if shouldSkipLogForCompleteMode(currentTime: currentTime, logThreshold: logThreshold) {
                    return
                }
                lastLogTime = currentTime
        }

        logCurrentSettings()
    }

    /// Determines whether the log should be skipped in smart mode based on the time since the last
    /// skip log.
    ///
    /// - Parameters:
    ///   - currentTime: The current time when the logging check is performed.
    ///   - skipLogThreshold: The time interval threshold for skipping logs.
    /// - Returns: `true` if the log should be skipped due to the skip log threshold;
    /// otherwise, `false`.
    private func shouldSkipLog(currentTime: Date, skipLogThreshold: TimeInterval) -> Bool {
        if let lastSkip = lastSkipLogTime, currentTime.timeIntervalSince(lastSkip) < skipLogThreshold {
            return true
        }
        return false
    }

    /// Determines whether logging should occur based on the log threshold and changes in the
    /// haptic settings state.
    ///
    /// - Parameters:
    ///   - currentTime: The current time when the logging check is performed.
    ///   - logThreshold: The time interval threshold for logging.
    /// - Returns: `true` if logging should occur; otherwise, `false`.
    private func shouldLogChanges(currentTime: Date, logThreshold: TimeInterval) -> Bool {
        if let lastTime = lastLogTime, currentTime.timeIntervalSince(lastTime) < logThreshold {
            let currentAppWideEnabled = _appWideEnabled
            let currentHapticEnabled = settings.isEnabled
            let appWideChanged = (lastAppWideEnabledState != currentAppWideEnabled)
            let hapticEnabledChanged = (lastHapticEnabledState != currentHapticEnabled)

            if !appWideChanged && !hapticEnabledChanged {
                logger.info("Skipping log: within threshold period and no significant changes detected.")
                lastSkipLogTime = currentTime
                return false
            }
        }
        return true
    }

    /// Resets the logging states to reflect the current haptic settings values.
    private func resetLoggingStates() {
        lastAppWideEnabledState = _appWideEnabled
        lastHapticEnabledState = settings.isEnabled
    }

    /// Updates the logging states and the last log time to the current values.
    ///
    /// - Parameter currentTime: The current time when the log is recorded.
    private func updateLoggingStates(currentTime: Date) {
        lastLogTime = currentTime
        resetLoggingStates()
    }

    /// Determines whether the log should be skipped in complete mode based on the time since the
    /// last log.
    ///
    /// - Parameters:
    ///   - currentTime: The current time when the logging check is performed.
    ///   - logThreshold: The time interval threshold for logging.
    /// - Returns: `true` if the log should be skipped due to the log threshold; otherwise, `false`.
    private func shouldSkipLogForCompleteMode(currentTime: Date, logThreshold: TimeInterval) -> Bool {
        if let lastTime = lastLogTime, currentTime.timeIntervalSince(lastTime) < logThreshold {
            return true
        }
        return false
    }

    /// Logs the current settings related to haptic feedback, including device capabilities and
    /// the current configuration of haptic settings.
    private func logCurrentSettings() {
        let settingsInfo: [String: Any] = [
            "DeviceCapabilities": ["isCapableOfHaptics": settings.isCapable],
            "CurrentSettings": [
                "hapticEffectsEnabled": _appWideEnabled,
                "hapticLoggingEnabled": settings.isLoggingEnabled,
                "hapticLastLogTime": lastLogTime?.formatted(.iso8601) ?? Date.now.formatted(.iso8601),
                "hapticLastAppWideEnabledState": lastAppWideEnabledState ?? false,
                "hapticLastHapticEnabledState": lastHapticEnabledState ?? false,
                "hapticLastKnownLoggingState": lastKnownLoggingState ?? false,
                "hapticLastSkipLogTime": lastSkipLogTime?.formatted(.iso8601) ?? Date.now.formatted(.iso8601)
            ]
        ]

        if let jsonData = try? JSONSerialization.data(withJSONObject: settingsInfo, options: .prettyPrinted),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            logger.log("\(jsonString, privacy: .public)")
        }
    }

    /// Logs a message indicating that haptics have been disabled via user defaults.
    private func logDisabledHapticMessage() {
        userDefaultsDisabledLogCount += 1
        if userDefaultsDisabledLogCount <= logThreshold {
            logger.info("Haptics have been disabled via UserDefaults.")
        }
    }

    /// Logs a message indicating that haptic logging is not enabled in production mode, limited
    /// to once.
    private func logProductionModeMessage() {
        guard productionModeLogCount == 0 else { return }
        logger.info("Haptic logging is not enabled in production mode.")
        productionModeLogCount += 1
    }
}

// MARK: - Feedback Methods

extension HapticsManager {

    /// Triggers a notification-style haptic feedback if haptics are supported and enabled.
    ///
    /// - Parameters:
    ///   - level: The type of notification feedback to trigger.
    ///   - loggingMode: The mode of logging to use when triggering feedback.
    internal func trigger(_ level: FBType, loggingMode: LoggingMode = .smart()) async {
        guard await canTriggerHaptic() else { return }
        if loggingMode.isComplete || loggingMode.isSmart { logSettings(mode: loggingMode) }
        notificationFeedback.notificationOccurred(level)
    }

    /// Triggers an impact-style haptic feedback if haptics are supported and enabled.
    ///
    /// - Parameters:
    ///   - level: The style of impact feedback to trigger.
    ///   - loggingMode: The mode of logging to use when triggering feedback.
    internal func trigger(_ level: FBStyle, loggingMode: LoggingMode = .smart()) async {
        do {
            guard await canTriggerHaptic() else { return }
            if loggingMode.isComplete || loggingMode.isSmart { logSettings(mode: loggingMode) }
            let generator = try await impactFeedbackGenerator(for: level)
            generator.impactOccurred()
        } catch {
            logger.error("Failed to trigger notification feedback for level \(level.rawValue, privacy: .public): \(error.localizedDescription, privacy: .public)")
        }
    }

    /// Provides an impact feedback generator for the specified feedback style, creating one if necessary.
    ///
    /// - Parameter level: The style of impact feedback to generate.
    /// - Returns: A `UIImpactFeedbackGenerator` instance configured for the specified feedback style.
    private func impactFeedbackGenerator(for level: FBStyle) async throws -> UIImpactFeedbackGenerator {
        if let existingGenerator = impactFeedbackGenerators[level] {
            return existingGenerator
        } else {
            let newGenerator = UIImpactFeedbackGenerator(style: level)
            impactFeedbackGenerators[level] = newGenerator
            return newGenerator
        }
    }
}

// MARK: - Helper Methods

extension HapticsManager {

    /// Checks whether haptic feedback can be triggered based on device capability and user settings.
    ///
    /// - Returns: `true` if haptic feedback can be triggered; otherwise, `false`.
    private func canTriggerHaptic() async -> Bool {
        guard settings.isCapable, appWideEnabled else { return false }
        return true
    }
}

#endif
