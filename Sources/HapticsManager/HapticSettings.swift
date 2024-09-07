//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// A protocol defining the settings required for managing haptic feedback.
/// 
/// Conforming types provide information about haptic capabilities and user preferences.
protocol HapticSettings {
    /// Indicates whether the device supports haptic feedback.
    var isCapable: Bool { get }

    /// Indicates whether haptic feedback is enabled by user settings.
    var isEnabled: Bool { get }

    /// Indicates whether logging for haptic actions is enabled.
    var isLoggingEnabled: Bool { get }
}
