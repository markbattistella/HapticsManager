//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

extension UserDefaults {

    /// A `UserDefaults` instance specifically used for managing haptic-related settings.
    ///
    /// This instance is created using an app group identifier to allow shared access between app
    /// extensions. If the app group cannot be found, the standard `UserDefaults` instance is used
    /// as a fallback.
    ///
    /// - Note: The app group identifier must be correctly configured for this to work. This allows
    /// for storing shared settings that can be accessed across different parts of the app, such
    /// as extensions or widgets.
    nonisolated(unsafe)
        public static let haptics: UserDefaults = {
            let appGroupIdentifier = HapticUserDefaultsKey.suiteName
            guard let userDefaults = UserDefaults(suiteName: appGroupIdentifier) else {

                // Fallback to the standard UserDefaults if the app group is unavailable.
                return .standard
            }
            return userDefaults
        }()
}
