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

}
