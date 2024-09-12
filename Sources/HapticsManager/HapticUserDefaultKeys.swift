//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation
import DefaultsKit

/// An externally accessible enumeration that defines keys for UserDefaults settings.
///
/// Conforming to `UserDefaultsKeyRepresentable` allows these keys to be easily used
/// with UserDefaults for storing and retrieving values.
public enum HapticUserDefaultKeys: String, UserDefaultsKeyRepresentable {
    
    /// Key for the user's preference on whether haptic effects are enabled.
    case hapticEffectsEnabled
    
    /// Key for the user's preference on whether logging is enabled for haptic actions.
    case hapticLoggingEnabled
    
    /// Key for tracking the number of log attempts.
    case hapticLogAttemptCount
    
    /// Key for storing the last log date.
    case hapticLogLastLogDate
    
    /// Key for the logging threshold value.
    case hapticLogThreshold
    
    /// Key for the logging cooldown period.
    case hapticLogCooldown
}
