//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

extension UserDefaults {

    /// A `UserDefaults` instance scoped to the app group for managing haptic feedback settings.
    ///
    /// This property provides access to a `UserDefaults` instance that is shared across the
    /// app group identified by `com.markbattistella.hapticsManager`. If the app group
    /// cannot be accessed, it defaults to the standard `UserDefaults`.
    ///
    /// - Note: Use this instance to store and retrieve haptic-related settings in a shared
    ///   context, such as across extensions or multiple apps in the same group.
    nonisolated(unsafe)
        public static let haptics: UserDefaults = {
            let appGroupIdentifier = "com.markbattistella.hapticsManager"
            guard let userDefaults = UserDefaults(suiteName: appGroupIdentifier) else {

                // Fallback to the standard UserDefaults if the app group is unavailable.
                return .standard
            }
            return userDefaults
        }()
}
