//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import DefaultsKit
import Foundation

/// Represents the keys used for managing haptic feedback preferences in `UserDefaults`.
///
/// This enum defines all the keys that are related to storing and retrieving haptic feedback
/// settings from `UserDefaults`, ensuring a centralized and type-safe approach.
public enum HapticUserDefaultsKey: String, UserDefaultsKeyRepresentable {

    /// The key used to determine whether haptic effects are enabled.
    case hapticEffectsEnabled
}
