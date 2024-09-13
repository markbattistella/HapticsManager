//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

#if os(iOS)

import SwiftUI

// MARK: - Haptic Actions

/// Triggers a notification-style haptic feedback.
public func hapticAction(_ type: FBType, loggingMode: LoggingMode = .smart()) {
    Task { await HapticsManager.shared.trigger(type, loggingMode: loggingMode) }
}

/// Triggers an impact-style haptic feedback.
public func hapticAction(_ style: FBStyle, loggingMode: LoggingMode = .smart()) {
    Task { await HapticsManager.shared.trigger(style, loggingMode: loggingMode) }
}

#endif
