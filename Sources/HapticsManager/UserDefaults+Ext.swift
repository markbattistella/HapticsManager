//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

extension UserDefaults {

  /// A `UserDefaults` instance specifically used for managing haptic-related settings.
  ///
  /// This instance is created using the package suite identifier to keep haptic preferences
  /// separate from the app's standard defaults. If the suite cannot be created, `.standard` is used
  /// as a fallback.
  public static var haptics: UserDefaults {
    let suiteName = HapticUserDefaultsKey.suiteName
    guard let userDefaults = UserDefaults(suiteName: suiteName) else {

      // Fallback to the standard UserDefaults if the suite is unavailable.
      return .standard
    }
    return userDefaults
  }
}
