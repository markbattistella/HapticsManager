//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

#if os(iOS)

import UIKit
import CoreHaptics
import SwiftUI
import DefaultsKit

/// Manages haptic feedback throughout the iOS application.
///
/// This manager uses the singleton pattern to provide a shared instance that ensures consistent
/// haptic feedback behavior across the app.
final internal class HapticsManager {

    /// The shared instance of the `HapticsManager`.
    internal static let shared = HapticsManager()

    /// Indicates if the current device supports haptic feedback.
    private let supportsHaptics: Bool

    /// A generator for producing notification-style haptic feedback.
    private let notificationFeedback = UINotificationFeedbackGenerator()

    /// A cache of `UIImpactFeedbackGenerator` instances, indexed by their feedback style.
    /// This allows for reusing instances for better performance.
    private var impactFeedbackGenerators: 
        [UIImpactFeedbackGenerator.FeedbackStyle: UIImpactFeedbackGenerator] = [:]

    /// A key representing the `UserDefaults` storage key for the haptics enabled setting.
    private let key: UserDefaultsKeyRepresentable = UserDefaultKeys.settingsHapticsEnabled

    /// A private backing store for the `appWideEnabled` property, indicating if haptic
    /// feedback is enabled application-wide.
    private var _appWideEnabled: Bool

    /// Indicates whether haptic feedback is enabled for the application.
    /// This value is read from `UserDefaults` and cached for efficient access.
    internal var appWideEnabled: Bool { _appWideEnabled }

    /// Initializes the haptic manager, setting up the necessary properties and observing 
    /// changes to user defaults.
    private init() {
        supportsHaptics = CHHapticEngine.capabilitiesForHardware().supportsHaptics
        _appWideEnabled = UserDefaults.standard.bool(for: key)
        observeUserDefaultsChanges()
    }

    /// Observes changes to the `UserDefaults` to update the `appWideEnabled` state.
    ///
    /// This method ensures that the application's haptic settings are updated in real-time
    /// when the user changes their preferences.
    private func observeUserDefaultsChanges() {
        NotificationCenter.default.addObserver(
            forName: UserDefaults.didChangeNotification, object: nil, queue: .main
        ) { [weak self] notification in
            guard let self = self else { return }
            self._appWideEnabled = UserDefaults.standard.bool(for: key)
        }
    }

    /// Triggers a notification-style haptic feedback if haptics are supported and enabled.
    ///
    /// - Parameter level: The type of notification feedback to trigger.
    internal func trigger(_ level: UINotificationFeedbackGenerator.FeedbackType) {
        guard supportsHaptics && appWideEnabled else { return }
        notificationFeedback.notificationOccurred(level)
    }

    /// Triggers an impact-style haptic feedback if haptics are supported and enabled.
    ///
    /// - Parameter level: The style of impact feedback to trigger.
    internal func trigger(_ level: UIImpactFeedbackGenerator.FeedbackStyle) {
        guard supportsHaptics && appWideEnabled else { return }
        let generator: UIImpactFeedbackGenerator
        if let existingGenerator = impactFeedbackGenerators[level] {
            generator = existingGenerator
        } else {
            generator = UIImpactFeedbackGenerator(style: level)
            impactFeedbackGenerators[level] = generator
        }
        generator.impactOccurred()
    }
}

// MARK: - View Modifiers

/// A view modifier that adds notification-style haptic feedback to a view upon tap.
///
/// This modifier listens for a tap gesture on the view it modifies and triggers
/// a notification-style haptic feedback based on the specified feedback type.
/// The actual haptic feedback is managed by the `HapticsManager`, which should
/// be configured to handle the supported types of haptic feedback.
internal struct HapticTypeViewModifier: ViewModifier {

    /// The type of notification feedback to trigger upon tap.
    var type: UINotificationFeedbackGenerator.FeedbackType

    /// Modifies the provided content by adding a gesture recognizer that triggers
    /// the specified notification-style haptic feedback when the content is tapped.
    ///
    /// - Parameter content: The content view to which the modifier is applied.
    /// - Returns: The modified view with an added tap gesture for haptic feedback.
    func body(content: Content) -> some View {
        content.gesture(TapGesture().onEnded { HapticsManager.shared.trigger(type) })
    }
}

/// A view modifier that adds impact-style haptic feedback to a view upon tap.
///
/// This modifier listens for a tap gesture on the view it modifies and triggers
/// an impact-style haptic feedback based on the specified feedback style.
/// The actual haptic feedback is managed by the `HapticsManager`, which should
/// be configured to handle the supported styles of haptic feedback.
internal struct HapticStyleViewModifier: ViewModifier {

    /// The style of impact feedback to trigger upon tap.
    var type: UIImpactFeedbackGenerator.FeedbackStyle

    /// Modifies the provided content by adding a gesture recognizer that triggers
    /// the specified impact-style haptic feedback when the content is tapped.
    ///
    /// - Parameter content: The content view to which the modifier is applied.
    /// - Returns: The modified view with an added tap gesture for haptic feedback.
    func body(content: Content) -> some View {
        content.gesture(TapGesture().onEnded { HapticsManager.shared.trigger(type) })
    }
}

// MARK: - Haptic Actions

/// Provides a global function to trigger notification-style haptic feedback.
///
/// - Parameter type: The type of notification feedback to trigger.
public func hapticAction(_ type: UINotificationFeedbackGenerator.FeedbackType) {
    HapticsManager.shared.trigger(type)
}

/// Provides a global function to trigger impact-style haptic feedback.
///
/// - Parameter style: The style of impact feedback to trigger.
public func hapticAction(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
    HapticsManager.shared.trigger(style)
}

// MARK: - View Extension

/// An extension to the `View` protocol to add haptic feedback functionality
/// to any SwiftUI view. This extension provides methods to apply either
/// notification-style or impact-style haptic feedback to a view.
extension View {

    /// Applies a notification-style haptic feedback to the view upon a tap gesture.
    ///
    /// This method simplifies the application of notification-style haptic feedback
    /// to a view by utilizing the `HapticTypeViewModifier`. When the view is tapped,
    /// the specified type of notification feedback is triggered.
    ///
    /// - Parameter type: The `UINotificationFeedbackGenerator.FeedbackType` value
    ///   representing the type of notification feedback to trigger.
    /// - Returns: A view that triggers the specified notification-style haptic feedback
    ///   when tapped.
    public func haptic(_ type: UINotificationFeedbackGenerator.FeedbackType) -> some View {
        self.modifier(HapticTypeViewModifier(type: type))
    }

    /// Applies an impact-style haptic feedback to the view upon a tap gesture.
    ///
    /// This method simplifies the application of impact-style haptic feedback
    /// to a view by utilizing the `HapticStyleViewModifier`. When the view is tapped,
    /// the specified style of impact feedback is triggered.
    ///
    /// - Parameter style: The `UIImpactFeedbackGenerator.FeedbackStyle` value
    ///   representing the style of impact feedback to trigger.
    /// - Returns: A view that triggers the specified impact-style haptic feedback
    ///   when tapped.
    public func haptic(_ style: UIImpactFeedbackGenerator.FeedbackStyle) -> some View {
        self.modifier(HapticStyleViewModifier(type: style))
    }
}

#endif
