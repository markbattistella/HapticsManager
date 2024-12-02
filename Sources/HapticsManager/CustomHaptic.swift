//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import Foundation

/// A protocol that defines a custom haptic feedback mechanism.
///
/// Types conforming to this protocol are expected to provide an implementation of the `play()`
/// method, which triggers the desired haptic feedback.
public protocol CustomHaptic {

    /// Triggers the haptic feedback defined by the conforming type.
    ///
    /// Implement this method to initiate the haptic feedback mechanism. This could be used for
    /// various user interactions or system events requiring tactile feedback.
    func play()
}
