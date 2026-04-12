//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import CoreHaptics
import HapticsManager

/// A collection of bundled haptic presets.
///
/// The preset data is generated from source material distributed under the MIT License.
public enum HapticPreset: String, CaseIterable, CustomHaptic {
    case afterglow
    case aftershock
    case alarm
    case anvil
    case applause
    case ascent
    case balloonPop
    case barrage
    case bassDrop
    case batter
    case bellToll
    case blip
    case bloom
    case bongo
    case boulder
    case breakingWave
    case breath
    case buildup
    case burst
    case buzz
    case cadence
    case cameraShutter
    case canter
    case cascade
    case castanets
    case catPaw
    case charge
    case chime
    case chip
    case chirp
    case clamor
    case clasp
    case cleave
    case coil
    case coinDrop
    case combinationLock
    case crescendo
    case dewdrop
    case dirge
    case dissolve
    case dogBark
    case drone
    case engineRev
    case exhale
    case explosion
    case fadeOut
    case fanfare
    case feather
    case finale
    case fingerDrum
    case firecracker
    case fizz
    case flare
    case flick
    case flinch
    case flourish
    case flurry
    case flush
    case gallop
    case gavel
    case glitch
    case guitarStrum
    case hail
    case hammer
    case heartbeat
    case herald
    case hoofBeat
    case ignition
    case impact
    case jolt
    case keyboardMechanical
    case keyboardMembrane
    case knell
    case knock
    case lament
    case latch
    case lighthouse
    case lilt
    case lock
    case lope
    case march
    case metronome
    case murmur
    case nudge
    case passingCar
    case patter
    case peal
    case peck
    case pendulum
    case ping
    case pip
    case piston
    case plink
    case plummet
    case plunk
    case poke
    case pound
    case powerDown
    case propel
    case pulse
    case pummel
    case push
    case radar
    case rain
    case ramp
    case rap
    case ratchet
    case rebound
    case ripple
    case rivet
    case rustle
    case shockwave
    case snap
    case sonar
    case spark
    case spin
    case stagger
    case stamp
    case stampede
    case stomp
    case stoneSkip
    case strike
    case summon
    case surge
    case sway
    case sweep
    case swell
    case syncopate
    case throb
    case thud
    case thump
    case thunder
    case thunderRoll
    case tickTock
    case tidalSurge
    case tideSwell
    case tremor
    case trigger
    case triumph
    case trumpet
    case typewriter
    case unfurl
    case vortex
    case wane
    case warDrum
    case waterfall
    case wave
    case wisp
    case wobble
    case woodpecker
    case zipper

    @MainActor
    public func play() {
        if let continuousPattern {
            playPattern(continuousPattern)
        }

        if let discretePattern {
            playPattern(discretePattern)
        }
    }
}
