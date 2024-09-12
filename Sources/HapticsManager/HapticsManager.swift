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

public typealias FBStyle = UIImpactFeedbackGenerator.FeedbackStyle
public typealias FBType = UINotificationFeedbackGenerator.FeedbackType

/// Extension to `LoggerCategory` to add a custom category for package haptic management.
extension LoggerCategory {
    internal static let packageHapticsManager = LoggerCategory("PackageHapticsManager")
}

/// A manager responsible for handling haptic feedback throughout the iOS application.
///
/// This class provides a singleton instance that ensures consistent haptic feedback behavior
/// across the app based on user preferences and device capabilities.
internal final class HapticsManager {
    
    /// The shared instance of `HapticsManager` for app-wide use.
    internal static let shared = HapticsManager()
    
    /// Returns the shared defaults object.
    private let defaults = UserDefaults.standard
    
    /// A generator for producing notification-style haptic feedback.
    private let notificationFeedback = UINotificationFeedbackGenerator()
    
    /// A cache of `UIImpactFeedbackGenerator` instances, indexed by their feedback style.
    private lazy var impactFeedbackGenerators: [FBStyle: UIImpactFeedbackGenerator] = [:]
    
    /// A private property that tracks whether haptic feedback is enabled app-wide.
    private var _appWideEnabled: Bool {
        didSet { log("Haptic settings changed: appWideEnabled is now \(_appWideEnabled)") }
    }
    
    /// A private queue used to synchronize access to settings to ensure thread safety.
    private let settingsQueue = DispatchQueue(
        label: "com.markbattistella.hapticsManager",
        attributes: .concurrent
    )
    
    /// The current settings for managing haptic feedback.
    private var settings: HapticSettings
    
    /// Indicates whether haptic feedback is enabled for the application, synchronized for
    /// thread safety.
    internal var appWideEnabled: Bool {
        settingsQueue.sync { _appWideEnabled }
    }
    
    /// A logger instance dedicated to haptics to handle and filter log outputs.
    private let logger = Logger(category: .packageHapticsManager)
    
    /// The count of log attempts, retrieved from UserDefaults.
    private var logAttemptCount: Int {
        get { defaults.integer(for: HapticUserDefaultKeys.hapticLogAttemptCount) }
        set { defaults.set(newValue, for: HapticUserDefaultKeys.hapticLogAttemptCount) }
    }
    
    /// The last time a log was made, retrieved from UserDefaults.
    private var lastLogTime: Date {
        get { defaults.date(for: HapticUserDefaultKeys.hapticLogLastLogDate) ?? .now }
        set { defaults.set(newValue, for: HapticUserDefaultKeys.hapticLogLastLogDate) }
    }
    
    /// The threshold for log attempts before logging again, retrieved from settings.
    private var logThreshold: Int {
        settings.loggingThreshold
    }
    
    /// The cooldown period in seconds before allowing another log, retrieved from settings.
    private var logCooldown: TimeInterval {
        settings.loggingCooldown
    }
    
    // MARK: - Initializers
    
    /// Initializes the `HapticsManager` with default settings.
    ///
    /// This initializer sets up the manager with default `UserDefaultsHapticSettings` and begins
    /// observing changes to user defaults to update settings in real-time.
    private init() {
        self.settings = HapticUserDefaultsSettings(
            hapticEnabledKey: HapticUserDefaultKeys.hapticEffectsEnabled,
            hapticLoggingEnabledKey: HapticUserDefaultKeys.hapticLoggingEnabled,
            hapticLoggingThresholdKey: HapticUserDefaultKeys.hapticLogThreshold,
            hapticLoggingCooldownKey: HapticUserDefaultKeys.hapticLogCooldown
        )
        self._appWideEnabled = settings.isEnabled
        self.resetLogTrackingIfHapticsEnabled()
        observeUserDefaultsChanges()
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

// MARK: - Setup methods

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
        ) { [weak self] _ in
            self?.updateAppWideEnabled()
        }
    }
    
    /// Updates the `appWideEnabled` property based on the current settings in a thread-safe
    /// manner.
    ///
    /// This method ensures that changes to the haptic settings are reflected immediately
    /// across the application when user preferences are updated.
    private func updateAppWideEnabled() {
        settingsQueue.async(flags: .barrier) {
            self._appWideEnabled = self.settings.isEnabled
        }
    }
    
    /// Sets custom haptic settings for the manager, allowing for testing or alternative
    /// configurations.
    ///
    /// - Parameter customSettings: A custom implementation of `HapticSettings`.
    internal func setCustomSettings(_ customSettings: HapticSettings) {
        settingsQueue.async(flags: .barrier) {
            self.settings = customSettings
            self._appWideEnabled = customSettings.isEnabled
        }
    }
}

// MARK: - Feedback methods

extension HapticsManager {
    
    /// Triggers a notification-style haptic feedback if haptics are supported and enabled.
    ///
    /// - Parameter level: The type of notification feedback to trigger.
    internal func trigger(_ level: FBType) async {
        guard await canTriggerHaptic() else { return }
        await notificationFeedback.notificationOccurred(level)
    }
    
    /// Triggers an impact-style haptic feedback if haptics are supported and enabled.
    ///
    /// - Parameter level: The style of impact feedback to trigger.
    internal func trigger(_ level: FBStyle) async {
        guard await canTriggerHaptic() else { return }
        let generator = await impactFeedbackGenerator(for: level)
        await generator.impactOccurred()
    }
    
    /// Provides an impact feedback generator for the specified feedback style, creating one if
    /// necessary.
    ///
    /// This method ensures that each feedback style uses a dedicated generator to optimize
    /// performance and minimize resource usage.
    ///
    /// - Parameter level: The style of impact feedback to generate.
    /// - Returns: A `UIImpactFeedbackGenerator` instance configured for the specified feedback
    /// style.
    @MainActor
    private func impactFeedbackGenerator(for level: FBStyle) async -> UIImpactFeedbackGenerator {
        if let existingGenerator = impactFeedbackGenerators[level] {
            return existingGenerator
        } else {
            let newGenerator = UIImpactFeedbackGenerator(style: level)
            impactFeedbackGenerators[level] = newGenerator
            return newGenerator
        }
    }
}

// MARK: - Helper methods

extension HapticsManager {
    
    /// Resets log tracking if haptics are re-enabled to prevent unnecessary log suppression.
    private func resetLogTrackingIfHapticsEnabled() {
        if _appWideEnabled {
            logAttemptCount = 0
            lastLogTime = Date()
        }
    }
    
    /// Checks whether haptic feedback can be triggered based on device capability and user
    /// settings.
    ///
    /// - Returns: `true` if haptic feedback can be triggered; otherwise, `false`.
    private func canTriggerHaptic() async -> Bool {
        guard settings.isCapable else {
            log("Haptics are not supported on this device.")
            return false
        }
        guard appWideEnabled else {
            log("Haptic have been disabled via UserDefaults.")
            return false
        }
        return true
    }
    
    /// Logs messages for debugging purposes if logging is enabled, with suppression logic.
    ///
    /// - Parameter message: The message to be logged.
    private func log(_ message: String, logLimit: Int = Int.max) {
        logAttemptCount += 1
        let currentTime = Date()
        
        // Only log if below the limit for this app session
        guard logAttemptCount <= logLimit else { return }
        
        // Log only if the threshold is reached or cooldown period has passed
        if logAttemptCount >= logThreshold || currentTime.timeIntervalSince(lastLogTime) >= logCooldown {
            if settings.isLoggingEnabled {
                logger.log("\(message, privacy: .public)")
            }
            logAttemptCount = 0
            lastLogTime = currentTime
        }
    }
}

// MARK: - View Modifiers

/// A view modifier that adds notification-style haptic feedback to a view upon tap.
///
/// This modifier listens for a tap gesture on the view it modifies and triggers a
/// notification-style haptic feedback based on the specified feedback type.
internal struct HapticTypeViewModifier: ViewModifier {
    
    /// The type of notification feedback to trigger upon tap.
    let type: FBType
    
    /// Modifies the provided content by adding a gesture recognizer that triggers
    /// the specified notification-style haptic feedback when the content is tapped.
    ///
    /// - Parameter content: The content view to which the modifier is applied.
    /// - Returns: The modified view with an added tap gesture for haptic feedback.
    func body(content: Content) -> some View {
        content.gesture(
            TapGesture().onEnded {
                Task { await HapticsManager.shared.trigger(type) }
            }
        )
    }
}

/// A view modifier that adds impact-style haptic feedback to a view upon tap.
///
/// This modifier listens for a tap gesture on the view it modifies and triggers an
/// impact-style haptic feedback based on the specified feedback style.
internal struct HapticStyleViewModifier: ViewModifier {
    
    /// The style of impact feedback to trigger upon tap.
    let type: FBStyle
    
    /// Modifies the provided content by adding a gesture recognizer that triggers the
    /// specified impact-style haptic feedback when the content is tapped.
    ///
    /// - Parameter content: The content view to which the modifier is applied.
    /// - Returns: The modified view with an added tap gesture for haptic feedback.
    func body(content: Content) -> some View {
        content.gesture(
            TapGesture().onEnded {
                Task { await HapticsManager.shared.trigger(type) }
            }
        )
    }
}

// MARK: - Haptic Actions

/// Provides a global function to trigger notification-style haptic feedback.
///
/// - Parameter type: The type of notification feedback to trigger.
public func hapticAction(_ type: FBType) {
    Task { await HapticsManager.shared.trigger(type) }
}

/// Provides a global function to trigger impact-style haptic feedback.
///
/// - Parameter style: The style of impact feedback to trigger.
public func hapticAction(_ style: FBStyle) {
    Task { await HapticsManager.shared.trigger(style) }
}

// MARK: - View Extension

extension View {
    
    /// Applies a notification-style haptic feedback to the view upon a tap gesture.
    ///
    /// This method simplifies the application of notification-style haptic feedback to a view
    /// by utilizing the `HapticTypeViewModifier`. When the view is tapped, the specified type
    /// of notification feedback is triggered.
    ///
    /// - Parameter type: The `UINotificationFeedbackGenerator.FeedbackType` value
    ///   representing the type of notification feedback to trigger.
    /// - Returns: A view that triggers the specified notification-style haptic feedback
    ///   when tapped.
    public func haptic(_ type: FBType) -> some View {
        self.modifier(HapticTypeViewModifier(type: type))
    }
    
    /// Applies an impact-style haptic feedback to the view upon a tap gesture.
    ///
    /// This method simplifies the application of impact-style haptic feedback to a view by
    /// utilizing the `HapticStyleViewModifier`. When the view is tapped, the specified style
    /// of impact feedback is triggered.
    ///
    /// - Parameter style: The `UIImpactFeedbackGenerator.FeedbackStyle` value
    ///   representing the style of impact feedback to trigger.
    /// - Returns: A view that triggers the specified impact-style haptic feedback
    ///   when tapped.
    public func haptic(_ style: FBStyle) -> some View {
        self.modifier(HapticStyleViewModifier(type: style))
    }
}

#endif
