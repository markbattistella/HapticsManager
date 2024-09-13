//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

#if os(iOS)

import Foundation
import DefaultsKit

// MARK: - Enum Definitions

/// Enum representing the keys for haptic user default settings.
public enum HapticUserDefaultKeys: String, UserDefaultsKeyRepresentable {
    
    /// The key for checking if haptic effects are enabled.
    case hapticEffectsEnabled
    
    /// The key for checking if haptic logging is enabled.
    case hapticLoggingEnabled
}

#endif
