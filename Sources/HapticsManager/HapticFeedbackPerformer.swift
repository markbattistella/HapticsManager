//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation
import TriggerKit
import UIKit

/// A performer for triggering haptic feedback in response to specific actions.
///
/// This struct provides a unified interface for handling various types of haptic feedback,
/// including impact, notification, and custom feedback. It ensures haptic feedback is only
/// executed if it is available and enabled.
public struct HapticFeedbackPerformer<T> where T: Equatable {}

/// Extension to conform to the `TriggerActionPerformable` protocol, enabling the performer
/// to act upon specific triggers.
extension HapticFeedbackPerformer: TriggerActionPerformable {

    /// The type of trigger that initiates the haptic feedback.
    public typealias Trigger = T

    /// Represents the different types of haptic feedback that can be performed.
    public enum Feedback {

        /// Triggers an impact-style feedback with a specified intensity.
        case impact(UIImpactFeedbackGenerator.FeedbackStyle)

        /// Triggers a notification-style feedback with a specified type.
        case notification(UINotificationFeedbackGenerator.FeedbackType)

        /// Triggers a custom haptic feedback as defined by a `CustomHaptic` instance.
        case custom(CustomHaptic)
    }

    /// Indicates whether haptic feedback is available on the device.
    ///
    /// - Returns: `true` if haptic feedback is supported by the device, otherwise `false`.
    public static var isAvailable: Bool {
        HapticFeedbackSettings.isHapticsAvailable
    }

    /// Indicates whether haptic feedback is enabled by the user or system settings.
    ///
    /// - Returns: `true` if haptic feedback is enabled, otherwise `false`.
    public static var isEnabled: Bool {
        HapticFeedbackSettings.isHapticsEnabled
    }

    /// Performs the specified haptic feedback action.
    ///
    /// - Parameter action: The type of feedback to perform. This can be an impact, notification,
    ///   or custom feedback.
    ///
    /// The method first checks if haptic feedback is available and enabled before executing
    /// the specified action.
    public static func perform(_ action: Feedback) {
        guard canPerform() else { return }

        switch action {
            case .impact(let feedbackStyle):
                Task { @MainActor in
                    let generator = UIImpactFeedbackGenerator(style: feedbackStyle)
                    generator.impactOccurred()
                }
            case .notification(let feedbackType):
                Task { @MainActor in
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(feedbackType)
                }
            case .custom(let customHaptic):
                customHaptic.play()
        }
    }
}

// MARK: - Helper

extension HapticFeedbackPerformer {

    /// Checks whether haptic feedback can currently be performed.
    ///
    /// - Returns: `true` if haptic feedback is both available and enabled, otherwise `false`.
    internal static func canPerform() -> Bool {
        return isAvailable && isEnabled
    }
}
