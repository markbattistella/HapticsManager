//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import SwiftUI
import TriggerKit

// MARK: - Static Action

extension View {

    /// Adds haptic feedback to a view based on a state change.
    ///
    /// This method triggers a specific haptic feedback when the provided `trigger` changes.
    ///
    /// - Parameters:
    ///   - feedback: The type of haptic feedback to perform.
    ///   - trigger: The state value that triggers the haptic feedback when it changes.
    /// - Returns: A modified view that performs haptic feedback on state change.
    public func hapticFeedback<T: Equatable>(
        _ feedback: HapticFeedbackPerformer<T>.Feedback,
        trigger: T
    ) -> some View {
        self.modifier(
            StateChangeModifier(
                feedback,
                trigger: trigger,
                actionHandler: { feedback in
                    HapticFeedbackPerformer<T>.perform(feedback)
                }
            )
        )
    }
}

// MARK: - Static Action with Condition

extension View {

    /// Adds haptic feedback to a view based on a conditional state change.
    ///
    /// This method triggers haptic feedback when the `trigger` changes and meets the specified
    /// condition.
    ///
    /// - Parameters:
    ///   - feedback: The type of haptic feedback to perform.
    ///   - trigger: The state value that triggers the haptic feedback.
    ///   - condition: A closure to determine whether haptic feedback should occur based on
    ///     the old and new `trigger` values.
    /// - Returns: A modified view that performs conditional haptic feedback on state change.
    public func hapticFeedback<T: Equatable>(
        _ feedback: HapticFeedbackPerformer<T>.Feedback,
        trigger: T,
        condition: @escaping (T, T) -> Bool
    ) -> some View {
        self.modifier(
            StateChangeModifier(
                feedback,
                trigger: trigger,
                condition: condition,
                actionHandler: { feedback in
                    HapticFeedbackPerformer<T>.perform(feedback)
                }
            )
        )
    }
}

// MARK: - Dynamic Action

extension View {

    /// Adds dynamic haptic feedback to a view based on a custom feedback-generating closure.
    ///
    /// This method triggers haptic feedback based on a dynamic evaluation of the old and new
    /// `trigger` values.
    ///
    /// - Parameters:
    ///   - trigger: The state value that triggers the dynamic feedback evaluation.
    ///   - feedback: A closure that takes the old and new `trigger` values and returns an
    ///     optional haptic feedback to perform.
    /// - Returns: A modified view that performs haptic feedback based on the closure's result.
    public func hapticFeedback<T: Equatable>(
        trigger: T,
        feedback: @escaping (
            T, T
        ) -> HapticFeedbackPerformer<T>.Feedback?
    ) -> some View {
        self.modifier(
            StateChangeModifier(
                trigger: trigger,
                dynamicAction: feedback,
                actionHandler: { feedback in
                    HapticFeedbackPerformer<T>.perform(feedback)
                }
            )
        )
    }
}
