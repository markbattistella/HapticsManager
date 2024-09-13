//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

#if os(iOS)

import SwiftUI

// MARK: - View Extension

extension View {
    
    /// Modifies the view to include notification-style haptic feedback.
    ///
    /// - Parameters:
    ///   - type: The type of feedback to trigger.
    ///   - loggingMode: The mode of logging to use when triggering feedback.
    /// - Returns: A modified view with haptic feedback.
    public func haptic(_ type: FBType, loggingMode: LoggingMode = .smart) -> some View {
        self.modifier(HapticTypeViewModifier(type: type, loggingMode: loggingMode))
    }
    
    /// Modifies the view to include impact-style haptic feedback.
    ///
    /// - Parameters:
    ///   - style: The style of feedback to trigger.
    ///   - loggingMode: The mode of logging to use when triggering feedback.
    /// - Returns: A modified view with haptic feedback.
    public func haptic(_ style: FBStyle, loggingMode: LoggingMode = .smart) -> some View {
        self.modifier(HapticStyleViewModifier(type: style, loggingMode: loggingMode))
    }
}

#endif
