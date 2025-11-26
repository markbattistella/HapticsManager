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
    /// This method triggers haptic feedback when the `trigger` changes and the condition evaluates
    /// to `true`.
    ///
    /// - Parameters:
    ///   - feedback: The type of haptic feedback to perform.
    ///   - trigger: The state value that triggers the haptic feedback.
    ///   - condition: A closure to determine whether haptic feedback should occur based on the old
    ///   and new `trigger` values.
    /// - Returns: A modified view that performs conditional haptic feedback on state change.
    public func hapticFeedback<T: Equatable>(
        _ feedback: HapticFeedbackPerformer<T>.Feedback,
        trigger: T,
        condition: @escaping (_ oldValue: T, _ newValue: T) -> Bool
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

    /// Adds haptic feedback to a view based on a conditional state change.
    ///
    /// This method triggers haptic feedback when the `trigger` changes and the condition evaluates
    /// to `true`.
    ///
    /// - Parameters:
    ///   - feedback: The type of haptic feedback to perform.
    ///   - trigger: The state value that triggers the haptic feedback.
    ///   - condition: A closure to determine whether haptic feedback should occur based on the
    ///   new `trigger` value.
    /// - Returns: A modified view that performs conditional haptic feedback on state change.
    public func hapticFeedback<T: Equatable>(
        _ feedback: HapticFeedbackPerformer<T>.Feedback,
        trigger: T,
        condition: @escaping (_ newValue: T) -> Bool
    ) -> some View {
        self.modifier(
            StateChangeModifier(
                feedback,
                trigger: trigger,
                condition: { _, newValue in
                    condition(newValue)
                },
                actionHandler: { feedback in
                    HapticFeedbackPerformer<T>.perform(feedback)
                }
            )
        )
    }

    /// Adds haptic feedback to a view based on a conditional state change.
    ///
    /// This method triggers haptic feedback when the condition evaluates to `true`.
    ///
    /// - Parameters:
    ///   - feedback: The type of haptic feedback to perform.
    ///   - trigger: The state value that triggers the haptic feedback.
    ///   - condition: A closure to determine whether haptic feedback should occur.
    /// - Returns: A modified view that performs conditional haptic feedback on state change.
    public func hapticFeedback<T: Equatable>(
        _ feedback: HapticFeedbackPerformer<T>.Feedback,
        trigger: T,
        condition: @escaping () -> Bool
    ) -> some View {
        self.modifier(
            StateChangeModifier(
                feedback,
                trigger: trigger,
                condition: { _, _ in condition() },
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
    ///   optional haptic feedback to perform.
    /// - Returns: A modified view that performs haptic feedback based on the closure's result.
    public func hapticFeedback<T: Equatable>(
        trigger: T,
        feedback: @escaping (_ oldValue: T, _ newValue: T) -> HapticFeedbackPerformer<T>.Feedback?
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

    /// Adds dynamic haptic feedback to a view based on a custom feedback-generating closure.
    ///
    /// This method triggers haptic feedback based on a dynamic evaluation of the new `trigger`
    /// value.
    ///
    /// - Parameters:
    ///   - trigger: The state value that triggers the dynamic feedback evaluation.
    ///   - feedback: A closure that takes the new `trigger` value and returns an optional haptic
    ///   feedback to perform.
    /// - Returns: A modified view that performs haptic feedback based on the closure's result.
    public func hapticFeedback<T: Equatable>(
        trigger: T,
        feedback: @escaping (_ newValue: T) -> HapticFeedbackPerformer<T>.Feedback?
    ) -> some View {
        self.modifier(
            StateChangeModifier(
                trigger: trigger,
                dynamicAction: { _, newValue in
                    feedback(newValue)
                },
                actionHandler: { feedback in
                    HapticFeedbackPerformer<T>.perform(feedback)
                }
            )
        )
    }

    /// Adds dynamic haptic feedback to a view based on a custom feedback-generating closure.
    ///
    /// This method triggers haptic feedback based on a dynamic evaluation with no parameters.
    ///
    /// - Parameters:
    ///   - trigger: The state value that triggers the dynamic feedback evaluation.
    ///   - feedback: A closure that returns an optional haptic feedback to perform.
    /// - Returns: A modified view that performs haptic feedback based on the closure's result.
    public func hapticFeedback<T: Equatable>(
        trigger: T,
        feedback: @escaping () -> HapticFeedbackPerformer<T>.Feedback?
    ) -> some View {
        self.modifier(
            StateChangeModifier(
                trigger: trigger,
                dynamicAction: { _, _ in feedback() },
                actionHandler: { feedback in
                    HapticFeedbackPerformer<T>.perform(feedback)
                }
            )
        )
    }
}

// MARK: - Immediate Action

extension View {

    /// Attaches haptic feedback to a view, triggered when the user taps it.
    ///
    /// This method applies a modifier that listens for tap gestures on the view and performs
    /// the supplied haptic feedback when tapped. Unlike ``inlineHaptic(_:)``, this approach
    /// does not require manual calls within an action handler and is suitable for views such
    /// as text, shapes, and images.
    ///
    /// When applied to a ``Button``, this modifier uses a simultaneous gesture so the button’s
    /// built-in tap behaviour continues to function. However, in some complex view
    /// hierarchies—such as ``Form`` or ``List``—gesture delivery is not guaranteed. In these
    /// cases, ``inlineHaptic(_:)`` is recommended for consistent behaviour.
    ///
    /// ```swift
    /// Text("Tap Me")
    ///     .padding()
    ///     .hapticFeedback(.impact(.medium))
    /// ```
    ///
    /// - Parameter feedback: The haptic feedback to perform when the user taps the view.
    /// - Returns: A modified view that triggers the specified feedback on tap.
    public func hapticFeedback(
        _ feedback: HapticFeedbackPerformer<UUID>.Feedback
    ) -> some View {
        modifier(
            ImmediateHapticModifier(feedback: feedback)
        )
    }
}

private struct ImmediateHapticModifier: ViewModifier {

    let feedback: HapticFeedbackPerformer<UUID>.Feedback

    /// Applies a tap-driven haptic feedback trigger to the modified view.
    ///
    /// This modifier listens for tap gestures using a simultaneous gesture, ensuring that
    /// existing interactions—such as button taps—continue to function normally. When the user
    /// taps the view, the supplied haptic feedback is executed.
    ///
    /// - Parameter content: The view being modified.
    /// - Returns: The view configured to trigger haptic feedback on tap.
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                TapGesture().onEnded {
                    HapticFeedbackPerformer<UUID>.perform(feedback)
                }
            )
    }
}

// MARK: - Global

/// Performs the specified haptic feedback immediately.
///
/// Use this method to trigger a haptic response directly from an event handler, such as
/// inside a button action, gesture, or asynchronous callback. The feedback is executed
/// imperatively and does not depend on view state or view lifecycle updates.
///
/// This method is the most reliable option for controls such as ``Button`` or views
/// contained within ``Form`` or ``List``, where SwiftUI may not always propagate tap
/// gestures to modifiers.
///
/// ```swift
/// Button("Submit") {
///     inlineHaptic(.notification(.success))
///     submitForm()
/// }
/// ```
///
/// - Parameter feedback: The haptic feedback to perform.
@inline(__always)
public func inlineHaptic(_ feedback: HapticFeedbackPerformer<UUID>.Feedback) {
    HapticFeedbackPerformer<UUID>.perform(feedback)
}
