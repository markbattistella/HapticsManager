//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import CoreHaptics.CHHapticEngine
import DefaultsKit
import Foundation

/// Provides settings and utility methods for managing haptic feedback capabilities and preferences.
///
/// This struct integrates with `UserDefaults` to check and manage the availability and
/// enablement status of haptic feedback on the device.
internal struct HapticFeedbackSettings {

    /// A reference to the user defaults used to store haptic settings.
    internal static var defaults: UserDefaults { .haptics }

    /// The key used to store and retrieve the haptic enabled/disabled state in user defaults.
    internal static var isHapticsEnabledKey: any UserDefaultsKeyRepresentable {
        HapticUserDefaultsKey.hapticEffectsEnabled
    }

    /// Indicates whether haptic feedback is available on the current device.
    internal static var isHapticsAvailable: Bool {
        CHHapticEngine.capabilitiesForHardware().supportsHaptics
    }

    /// Indicates whether haptic feedback is enabled based on user preferences.
    internal static var isHapticsEnabled: Bool {
        defaults.bool(for: isHapticsEnabledKey)
    }
}
