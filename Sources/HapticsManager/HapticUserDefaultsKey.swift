//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import DefaultsKit
import Foundation

/// An enumeration representing keys for storing haptic-related settings in `UserDefaults`.
/// Each case corresponds to a specific setting that can be stored and retrieved.
public enum HapticUserDefaultsKey: String, UserDefaultsKeyRepresentable {

    /// The key used to determine whether haptic effects are enabled.
    case hapticEffectsEnabled

    /// Default suite name to group all package keys.
    public static var suiteName: String? {
        "com.markbattistella.packages.hapticsManager"
    }
}
