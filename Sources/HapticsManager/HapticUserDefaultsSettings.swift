//
// Project: 
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation
import DefaultsKit
import CoreHaptics.CHHapticEngine

/// A concrete implementation of `HapticSettings` that uses `UserDefaults` to store and
/// retrieve user preferences related to haptic feedback.
final class HapticUserDefaultsSettings: HapticSettings {

    private let hapticCapableKey: Bool
    private let hapticEnabledKey: any UserDefaultsKeyRepresentable
    private let loggingEnabledKey: any UserDefaultsKeyRepresentable

    /// Initializes a new instance of `UserDefaultsHapticSettings` with the specified keys.
    ///
    /// - Parameters:
    ///   - hapticEnabledKey: The key for storing whether haptic feedback is enabled.
    ///   - loggingEnabledKey: The key for storing whether logging is enabled.
    init(
        hapticEnabledKey: any UserDefaultsKeyRepresentable,
        loggingEnabledKey: any UserDefaultsKeyRepresentable
    ) {
        self.hapticCapableKey = CHHapticEngine.capabilitiesForHardware().supportsHaptics
        self.hapticEnabledKey = hapticEnabledKey
        self.loggingEnabledKey = loggingEnabledKey
    }

    /// A Boolean value indicating whether the device supports haptic feedback.
    var isCapable: Bool {
        hapticCapableKey
    }

    /// A Boolean value indicating whether haptic feedback is enabled based on user settings.
    var isEnabled: Bool {
        UserDefaults.standard.bool(for: hapticEnabledKey)
    }

    /// A Boolean value indicating whether logging is enabled for haptic actions.
    var isLoggingEnabled: Bool {
        UserDefaults.standard.bool(for: loggingEnabledKey)
    }
}
