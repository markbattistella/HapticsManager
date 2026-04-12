//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import CoreHaptics

extension HapticPreset {

    var continuousEnvelopeNZ: ContinuousEnvelope? {
        switch self {
        case .march:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.9,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.015, value: 0.6),
                    .init(time: 0.15, value: 0.45),
                    .init(time: 0.25, value: 0.0),
                    .init(time: 0.3, value: 0.0),
                    .init(time: 0.315, value: 0.65),
                    .init(time: 0.45, value: 0.5),
                    .init(time: 0.55, value: 0.0),
                    .init(time: 0.6, value: 0.0),
                    .init(time: 0.615, value: 0.6),
                    .init(time: 0.75, value: 0.4),
                    .init(time: 0.9, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.25),
                    .init(time: 0.9, value: 0.25)
                ]
            )

        case .metronome:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.28,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.45),
                    .init(time: 0.08, value: 0.0),
                    .init(time: 0.2, value: 0.0),
                    .init(time: 0.208, value: 0.45),
                    .init(time: 0.28, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.5),
                    .init(time: 0.28, value: 0.5)
                ]
            )

        case .murmur:
            return nil

        case .nudge:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.18,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.01, value: 0.6),
                    .init(time: 0.06, value: 0.0),
                    .init(time: 0.12, value: 0.4),
                    .init(time: 0.18, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.5),
                    .init(time: 0.18, value: 0.5)
                ]
            )

        case .passingCar:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.1,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.08, value: 0.1),
                    .init(time: 0.2, value: 0.35),
                    .init(time: 0.35, value: 0.75),
                    .init(time: 0.45, value: 1.0),
                    .init(time: 0.55, value: 0.7),
                    .init(time: 0.7, value: 0.3),
                    .init(time: 0.9, value: 0.08),
                    .init(time: 1.1, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.35),
                    .init(time: 0.2, value: 0.42),
                    .init(time: 0.45, value: 0.38),
                    .init(time: 0.7, value: 0.3),
                    .init(time: 1.1, value: 0.22)
                ]
            )

        case .patter:
            return nil

        case .peal:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.438,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.75),
                    .init(time: 0.08, value: 0.0),
                    .init(time: 0.18, value: 0.75),
                    .init(time: 0.258, value: 0.0),
                    .init(time: 0.36, value: 0.75),
                    .init(time: 0.438, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.62),
                    .init(time: 0.438, value: 0.62)
                ]
            )

        case .peck:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.028,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.004, value: 0.55),
                    .init(time: 0.028, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.58),
                    .init(time: 0.028, value: 0.56)
                ]
            )

        case .pendulum:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 2.4,
                amplitudePoints: [
                    .init(time: 0, value: 0.7),
                    .init(time: 0.3, value: 0.08),
                    .init(time: 0.6, value: 0.5),
                    .init(time: 0.9, value: 0.05),
                    .init(time: 1.2, value: 0.3),
                    .init(time: 1.5, value: 0.03),
                    .init(time: 1.8, value: 0.15),
                    .init(time: 2.1, value: 0.01),
                    .init(time: 2.4, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.42),
                    .init(time: 2.4, value: 0.38)
                ]
            )

        case .ping:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.035,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.004, value: 0.65),
                    .init(time: 0.035, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.72),
                    .init(time: 0.035, value: 0.68)
                ]
            )

        case .pip:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.1,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.32),
                    .init(time: 0.04, value: 0.0),
                    .init(time: 0.06, value: 0.22),
                    .init(time: 0.1, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.65),
                    .init(time: 0.1, value: 0.7)
                ]
            )

        case .piston:
            return nil

        case .plink:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.215,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.55),
                    .init(time: 0.065, value: 0.0),
                    .init(time: 0.15, value: 0.55),
                    .init(time: 0.215, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.52),
                    .init(time: 0.215, value: 0.52)
                ]
            )

        case .plummet:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.05,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.3, value: 0.02),
                    .init(time: 0.6, value: 0.06),
                    .init(time: 0.8, value: 0.15),
                    .init(time: 0.88, value: 0.3),
                    .init(time: 0.895, value: 0.5),
                    .init(time: 0.9, value: 0.0),
                    .init(time: 0.905, value: 1.0),
                    .init(time: 0.96, value: 0.4),
                    .init(time: 1.05, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.3),
                    .init(time: 0.895, value: 0.4),
                    .init(time: 0.905, value: 0.3),
                    .init(time: 1.05, value: 0.25)
                ]
            )

        case .plunk:
            return nil

        case .poke:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.28,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.6),
                    .init(time: 0.062, value: 0.0),
                    .init(time: 0.1, value: 0.6),
                    .init(time: 0.162, value: 0.0),
                    .init(time: 0.2, value: 0.7),
                    .init(time: 0.28, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.6),
                    .init(time: 0.2, value: 0.65),
                    .init(time: 0.28, value: 0.63)
                ]
            )

        case .pound:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.265,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.95),
                    .init(time: 0.065, value: 0.0),
                    .init(time: 0.1, value: 0.95),
                    .init(time: 0.165, value: 0.0),
                    .init(time: 0.2, value: 0.95),
                    .init(time: 0.265, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.72),
                    .init(time: 0.265, value: 0.72)
                ]
            )

        case .powerDown:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.8,
                amplitudePoints: [
                    .init(time: 0, value: 0.8),
                    .init(time: 0.2, value: 0.7),
                    .init(time: 0.45, value: 0.55),
                    .init(time: 0.75, value: 0.4),
                    .init(time: 1.05, value: 0.25),
                    .init(time: 1.35, value: 0.12),
                    .init(time: 1.6, value: 0.03),
                    .init(time: 1.8, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.6),
                    .init(time: 1.8, value: 0.03)
                ]
            )

        case .propel:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.3,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.55),
                    .init(time: 0.07, value: 0.2),
                    .init(time: 0.12, value: 0.88),
                    .init(time: 0.2, value: 0.2),
                    .init(time: 0.3, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.56),
                    .init(time: 0.12, value: 0.72),
                    .init(time: 0.3, value: 0.65)
                ]
            )

        case .pulse:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 2,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.3, value: 0.3),
                    .init(time: 0.7, value: 0.3),
                    .init(time: 1, value: 0.0),
                    .init(time: 1.3, value: 0.3),
                    .init(time: 1.7, value: 0.3),
                    .init(time: 2, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.4),
                    .init(time: 2, value: 0.4)
                ]
            )

        case .pummel:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.45,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.004, value: 0.9),
                    .init(time: 0.045, value: 0.6),
                    .init(time: 0.07, value: 0.78),
                    .init(time: 0.1, value: 0.55),
                    .init(time: 0.13, value: 0.92),
                    .init(time: 0.165, value: 0.65),
                    .init(time: 0.19, value: 0.82),
                    .init(time: 0.23, value: 0.7),
                    .init(time: 0.25, value: 1.0),
                    .init(time: 0.32, value: 0.4),
                    .init(time: 0.45, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.85),
                    .init(time: 0.45, value: 0.82)
                ]
            )

        case .push:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.09,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.006, value: 0.48),
                    .init(time: 0.05, value: 0.15),
                    .init(time: 0.09, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.52),
                    .init(time: 0.09, value: 0.5)
                ]
            )

        case .radar:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 2.52,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.006, value: 0.55),
                    .init(time: 0.05, value: 0.2),
                    .init(time: 0.12, value: 0.0),
                    .init(time: 0.8, value: 0.0),
                    .init(time: 0.806, value: 0.55),
                    .init(time: 0.85, value: 0.2),
                    .init(time: 0.92, value: 0.0),
                    .init(time: 1.6, value: 0.0),
                    .init(time: 1.606, value: 0.55),
                    .init(time: 1.65, value: 0.2),
                    .init(time: 1.72, value: 0.0),
                    .init(time: 2.4, value: 0.0),
                    .init(time: 2.406, value: 0.55),
                    .init(time: 2.45, value: 0.2),
                    .init(time: 2.52, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.55),
                    .init(time: 2.52, value: 0.55)
                ]
            )

        case .rain:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.95,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.05, value: 0.08),
                    .init(time: 0.2, value: 0.05),
                    .init(time: 0.4, value: 0.08),
                    .init(time: 0.6, value: 0.05),
                    .init(time: 0.85, value: 0.08),
                    .init(time: 0.95, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.6),
                    .init(time: 0.95, value: 0.6)
                ]
            )

        case .ramp:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.65,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.015, value: 0.38),
                    .init(time: 0.08, value: 0.0),
                    .init(time: 0.12, value: 0.55),
                    .init(time: 0.19, value: 0.0),
                    .init(time: 0.24, value: 0.72),
                    .init(time: 0.31, value: 0.0),
                    .init(time: 0.38, value: 1.0),
                    .init(time: 0.52, value: 0.2),
                    .init(time: 0.65, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.48),
                    .init(time: 0.38, value: 0.78),
                    .init(time: 0.65, value: 0.75)
                ]
            )

        case .rap:
            return nil

        case .ratchet:
            return nil

        case .rebound:
            return nil

        case .ripple:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.42,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.07, value: 0.0),
                    .init(time: 0.145, value: 0.5),
                    .init(time: 0.2, value: 0.0),
                    .init(time: 0.265, value: 0.2),
                    .init(time: 0.31, value: 0.0),
                    .init(time: 0.365, value: 0.07),
                    .init(time: 0.42, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.7),
                    .init(time: 0.14, value: 0.5),
                    .init(time: 0.26, value: 0.33),
                    .init(time: 0.42, value: 0.18)
                ]
            )

        case .rivet:
            return nil

        case .rustle:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.29,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.65),
                    .init(time: 0.075, value: 0.05),
                    .init(time: 0.2, value: 0.3),
                    .init(time: 0.29, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.6),
                    .init(time: 0.2, value: 0.48),
                    .init(time: 0.29, value: 0.45)
                ]
            )

        case .shockwave:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.8,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 1.0),
                    .init(time: 0.05, value: 0.7),
                    .init(time: 0.12, value: 0.45),
                    .init(time: 0.2, value: 0.3),
                    .init(time: 0.32, value: 0.15),
                    .init(time: 0.45, value: 0.08),
                    .init(time: 0.6, value: 0.03),
                    .init(time: 0.8, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.4),
                    .init(time: 0.005, value: 0.3),
                    .init(time: 0.8, value: 0.2)
                ]
            )

        case .snap:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.09,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.004, value: 0.7),
                    .init(time: 0.03, value: 0.15),
                    .init(time: 0.04, value: 0.3),
                    .init(time: 0.09, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.55),
                    .init(time: 0.04, value: 0.47),
                    .init(time: 0.09, value: 0.45)
                ]
            )

        case .sonar:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 2,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.35),
                    .init(time: 0.13, value: 0.04),
                    .init(time: 0.5, value: 0.0),
                    .init(time: 0.6, value: 0.35),
                    .init(time: 0.73, value: 0.04),
                    .init(time: 1.1, value: 0.0),
                    .init(time: 1.2, value: 0.35),
                    .init(time: 1.33, value: 0.04),
                    .init(time: 1.55, value: 0.0),
                    .init(time: 1.62, value: 0.0),
                    .init(time: 1.663, value: 0.855),
                    .init(time: 1.7, value: 0.0),
                    .init(time: 1.8, value: 0.65),
                    .init(time: 1.855, value: 0.0),
                    .init(time: 1.92, value: 0.4),
                    .init(time: 2, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.72),
                    .init(time: 1.55, value: 0.72),
                    .init(time: 1.655, value: 0.8),
                    .init(time: 2, value: 0.7)
                ]
            )

        case .spark:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.185,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.004, value: 0.22),
                    .init(time: 0.028, value: 0.0),
                    .init(time: 0.069, value: 0.52),
                    .init(time: 0.095, value: 0.0),
                    .init(time: 0.142, value: 1.0),
                    .init(time: 0.185, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.5),
                    .init(time: 0.065, value: 0.75),
                    .init(time: 0.138, value: 1.0),
                    .init(time: 0.185, value: 1.0)
                ]
            )

        case .spin:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.808,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.38),
                    .init(time: 0.06, value: 0.0),
                    .init(time: 0.25, value: 0.38),
                    .init(time: 0.308, value: 0.0),
                    .init(time: 0.5, value: 0.38),
                    .init(time: 0.558, value: 0.0),
                    .init(time: 0.75, value: 0.38),
                    .init(time: 0.808, value: 0.0),
                    .init(time: 1, value: 0.38),
                    .init(time: 1.058, value: 0.0),
                    .init(time: 1.25, value: 0.38),
                    .init(time: 1.308, value: 0.0),
                    .init(time: 1.5, value: 0.38),
                    .init(time: 1.558, value: 0.0),
                    .init(time: 1.75, value: 0.38),
                    .init(time: 1.808, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.55),
                    .init(time: 1.808, value: 0.55)
                ]
            )

        case .stagger:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.32,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.68),
                    .init(time: 0.045, value: 0.15),
                    .init(time: 0.06, value: 0.38),
                    .init(time: 0.1, value: 0.15),
                    .init(time: 0.12, value: 0.52),
                    .init(time: 0.162, value: 0.12),
                    .init(time: 0.18, value: 0.33),
                    .init(time: 0.32, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.55),
                    .init(time: 0.06, value: 0.65),
                    .init(time: 0.12, value: 0.5),
                    .init(time: 0.18, value: 0.6),
                    .init(time: 0.32, value: 0.55)
                ]
            )

        case .stamp:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.205,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.55),
                    .init(time: 0.055, value: 0.0),
                    .init(time: 0.15, value: 0.55),
                    .init(time: 0.205, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.5),
                    .init(time: 0.205, value: 0.5)
                ]
            )

        case .stampede:
            return nil

        case .stomp:
            return nil

        case .stoneSkip:
            return nil

        case .strike:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.08,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.72),
                    .init(time: 0.04, value: 0.2),
                    .init(time: 0.08, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.62),
                    .init(time: 0.08, value: 0.6)
                ]
            )

        case .summon:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.5,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.01, value: 0.8),
                    .init(time: 0.18, value: 0.0),
                    .init(time: 0.3, value: 0.7),
                    .init(time: 0.37, value: 0.0),
                    .init(time: 0.43, value: 0.7),
                    .init(time: 0.5, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.52),
                    .init(time: 0.18, value: 0.52),
                    .init(time: 0.3, value: 0.62),
                    .init(time: 0.5, value: 0.62)
                ]
            )

        case .surge:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.33,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.45),
                    .init(time: 0.06, value: 0.1),
                    .init(time: 0.075, value: 0.58),
                    .init(time: 0.13, value: 0.12),
                    .init(time: 0.145, value: 0.7),
                    .init(time: 0.195, value: 0.15),
                    .init(time: 0.21, value: 0.8),
                    .init(time: 0.33, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.82),
                    .init(time: 0.21, value: 0.93),
                    .init(time: 0.33, value: 0.9)
                ]
            )

        case .sway:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.9,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.02, value: 0.45),
                    .init(time: 0.25, value: 0.35),
                    .init(time: 0.5, value: 0.0),
                    .init(time: 0.7, value: 0.0),
                    .init(time: 0.72, value: 0.45),
                    .init(time: 0.95, value: 0.35),
                    .init(time: 1.2, value: 0.0),
                    .init(time: 1.4, value: 0.0),
                    .init(time: 1.42, value: 0.45),
                    .init(time: 1.65, value: 0.35),
                    .init(time: 1.9, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.22),
                    .init(time: 1.9, value: 0.22)
                ]
            )

        case .sweep:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 2.1,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.4),
                    .init(time: 0.12, value: 0.05),
                    .init(time: 0.4, value: 0.02),
                    .init(time: 0.59, value: 0.0),
                    .init(time: 0.6, value: 0.4),
                    .init(time: 0.72, value: 0.05),
                    .init(time: 1, value: 0.02),
                    .init(time: 1.19, value: 0.0),
                    .init(time: 1.2, value: 0.4),
                    .init(time: 1.32, value: 0.05),
                    .init(time: 1.6, value: 0.02),
                    .init(time: 1.79, value: 0.0),
                    .init(time: 1.8, value: 0.4),
                    .init(time: 1.92, value: 0.05),
                    .init(time: 2.1, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.72),
                    .init(time: 2.1, value: 0.72)
                ]
            )

        case .swell:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.425,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.01, value: 0.45),
                    .init(time: 0.075, value: 0.0),
                    .init(time: 0.35, value: 0.65),
                    .init(time: 0.425, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.45),
                    .init(time: 0.35, value: 0.52),
                    .init(time: 0.425, value: 0.52)
                ]
            )

        case .syncopate:
            return nil

        case .throb:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.23,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.8),
                    .init(time: 0.08, value: 0.0),
                    .init(time: 0.15, value: 0.45),
                    .init(time: 0.23, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.65),
                    .init(time: 0.23, value: 0.6)
                ]
            )

        case .thud:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.16,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.015, value: 0.45),
                    .init(time: 0.08, value: 0.35),
                    .init(time: 0.16, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.42),
                    .init(time: 0.16, value: 0.4)
                ]
            )

        case .thump:
            return nil

        case .thunder:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 2,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.1, value: 0.05),
                    .init(time: 0.3, value: 0.1),
                    .init(time: 0.5, value: 0.2),
                    .init(time: 0.59, value: 0.3),
                    .init(time: 0.6, value: 1.0),
                    .init(time: 0.68, value: 0.7),
                    .init(time: 0.8, value: 0.5),
                    .init(time: 1, value: 0.3),
                    .init(time: 1.3, value: 0.15),
                    .init(time: 1.7, value: 0.05),
                    .init(time: 2, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.1),
                    .init(time: 0.6, value: 0.08),
                    .init(time: 2, value: 0.05)
                ]
            )

        case .thunderRoll:
            return nil

        case .tickTock:
            return nil

        case .tidalSurge:
            return nil

        case .tideSwell:
            return nil

        case .tremor:
            return nil

        case .trigger:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.28,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.004, value: 1.0),
                    .init(time: 0.055, value: 0.35),
                    .init(time: 0.08, value: 0.5),
                    .init(time: 0.14, value: 0.2),
                    .init(time: 0.2, value: 0.25),
                    .init(time: 0.28, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.72),
                    .init(time: 0.08, value: 0.55),
                    .init(time: 0.28, value: 0.42)
                ]
            )

        case .triumph:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.1,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.01, value: 0.4),
                    .init(time: 0.07, value: 0.0),
                    .init(time: 0.12, value: 0.55),
                    .init(time: 0.18, value: 0.0),
                    .init(time: 0.26, value: 0.7),
                    .init(time: 0.32, value: 0.0),
                    .init(time: 0.42, value: 0.85),
                    .init(time: 0.48, value: 0.0),
                    .init(time: 0.6, value: 1.0),
                    .init(time: 0.66, value: 0.0),
                    .init(time: 0.75, value: 1.0),
                    .init(time: 0.81, value: 0.0),
                    .init(time: 0.9, value: 1.0),
                    .init(time: 0.98, value: 0.4),
                    .init(time: 1.1, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.5),
                    .init(time: 0.6, value: 0.75),
                    .init(time: 1.1, value: 0.85)
                ]
            )

        case .trumpet:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.46,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.01, value: 0.3),
                    .init(time: 0.04, value: 0.0),
                    .init(time: 0.08, value: 0.4),
                    .init(time: 0.11, value: 0.0),
                    .init(time: 0.15, value: 0.5),
                    .init(time: 0.175, value: 0.0),
                    .init(time: 0.21, value: 0.6),
                    .init(time: 0.232, value: 0.0),
                    .init(time: 0.26, value: 0.7),
                    .init(time: 0.278, value: 0.0),
                    .init(time: 0.31, value: 1.0),
                    .init(time: 0.38, value: 0.6),
                    .init(time: 0.46, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.4),
                    .init(time: 0.31, value: 0.7),
                    .init(time: 0.46, value: 0.9)
                ]
            )

        case .typewriter:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.2,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.006, value: 0.85),
                    .init(time: 0.04, value: 0.3),
                    .init(time: 0.055, value: 0.38),
                    .init(time: 0.09, value: 0.12),
                    .init(time: 0.11, value: 0.15),
                    .init(time: 0.16, value: 0.04),
                    .init(time: 0.2, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.42),
                    .init(time: 0.055, value: 0.38),
                    .init(time: 0.2, value: 0.34)
                ]
            )

        case .unfurl:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.18,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.5),
                    .init(time: 0.068, value: 0.0),
                    .init(time: 0.093, value: 0.62),
                    .init(time: 0.158, value: 0.0),
                    .init(time: 0.183, value: 0.74),
                    .init(time: 0.248, value: 0.0),
                    .init(time: 0.273, value: 0.86),
                    .init(time: 0.338, value: 0.0),
                    .init(time: 0.363, value: 1.0),
                    .init(time: 0.85, value: 0.6),
                    .init(time: 1.05, value: 0.2),
                    .init(time: 1.18, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.28),
                    .init(time: 0.09, value: 0.4),
                    .init(time: 0.18, value: 0.49),
                    .init(time: 0.27, value: 0.62),
                    .init(time: 0.36, value: 0.7),
                    .init(time: 1.18, value: 0.7)
                ]
            )

        case .vortex:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.4,
                amplitudePoints: [
                    .init(time: 0, value: 0.05),
                    .init(time: 0.2, value: 0.08),
                    .init(time: 0.4, value: 0.13),
                    .init(time: 0.6, value: 0.22),
                    .init(time: 0.8, value: 0.35),
                    .init(time: 0.95, value: 0.52),
                    .init(time: 1.05, value: 0.72),
                    .init(time: 1.15, value: 0.9),
                    .init(time: 1.195, value: 0.0),
                    .init(time: 1.2, value: 1.0),
                    .init(time: 1.25, value: 0.3),
                    .init(time: 1.4, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.25),
                    .init(time: 0.6, value: 0.4),
                    .init(time: 1, value: 0.62),
                    .init(time: 1.15, value: 0.82),
                    .init(time: 1.2, value: 0.9),
                    .init(time: 1.4, value: 0.5)
                ]
            )

        case .wane:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.45,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.02, value: 0.42),
                    .init(time: 0.18, value: 0.22),
                    .init(time: 0.45, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.5),
                    .init(time: 0.18, value: 0.4),
                    .init(time: 0.45, value: 0.35)
                ]
            )

        case .warDrum:
            return nil

        case .waterfall:
            return nil

        case .wave:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 2.8,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.4, value: 0.38),
                    .init(time: 0.8, value: 0.05),
                    .init(time: 1.2, value: 0.4),
                    .init(time: 1.6, value: 0.05),
                    .init(time: 2, value: 0.38),
                    .init(time: 2.4, value: 0.05),
                    .init(time: 2.8, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.35),
                    .init(time: 2.8, value: 0.35)
                ]
            )

        case .wisp:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.06,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.22),
                    .init(time: 0.06, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.48),
                    .init(time: 0.06, value: 0.48)
                ]
            )

        case .wobble:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.18,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.65),
                    .init(time: 0.08, value: 0.5),
                    .init(time: 0.18, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.82),
                    .init(time: 0.18, value: 0.75)
                ]
            )

        case .woodpecker:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.46,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.65),
                    .init(time: 0.43, value: 0.65),
                    .init(time: 0.46, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.82),
                    .init(time: 0.46, value: 0.82)
                ]
            )

        case .zipper:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.46,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.006, value: 0.234),
                    .init(time: 0.432, value: 0.231),
                    .init(time: 0.46, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.616),
                    .init(time: 0.358, value: 0.594),
                    .init(time: 0.46, value: 0.35)
                ]
            )

        default:
            return nil
        }
    }
}
