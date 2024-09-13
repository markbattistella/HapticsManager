//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

#if os(iOS)

import SwiftUI

// MARK: - View Modifiers

/// A view modifier for triggering notification-style haptic feedback.
internal struct HapticTypeViewModifier: ViewModifier, Sendable {
    let type: FBType
    let loggingMode: LoggingMode
    
    func body(content: Content) -> some View {
        content.gesture(
            TapGesture().onEnded {
                Task { await HapticsManager.shared.trigger(type, loggingMode: loggingMode) }
            }
        )
    }
}

/// A view modifier for triggering impact-style haptic feedback.
internal struct HapticStyleViewModifier: ViewModifier, Sendable {
    let type: FBStyle
    let loggingMode: LoggingMode
    
    func body(content: Content) -> some View {
        content.gesture(
            TapGesture().onEnded {
                Task { await HapticsManager.shared.trigger(type, loggingMode: loggingMode) }
            }
        )
    }
}

#endif
