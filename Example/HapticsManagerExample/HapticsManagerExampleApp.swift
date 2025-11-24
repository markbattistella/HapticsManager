//
// Project: HapticsManagerExample
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import SwiftUI
import HapticsManager
import DefaultsKit

@main
struct HapticsManagerExampleApp: App {

    init() {
        UserDefaults.haptics
            .set(true, for: HapticUserDefaultsKey.hapticEffectsEnabled)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
