//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

#if os(iOS)

import Foundation

// MARK: - Protocol Definitions

/// A protocol defining the settings required for managing haptic feedback.
protocol HapticSettings {
    
    /// Indicates if the device supports haptics.
    var isCapable: Bool { get }
    
    /// Indicates if haptic feedback is enabled.
    var isEnabled: Bool { get }
    
    /// Indicates if logging for haptics is enabled.
    var isLoggingEnabled: Bool { get }
}

#endif
