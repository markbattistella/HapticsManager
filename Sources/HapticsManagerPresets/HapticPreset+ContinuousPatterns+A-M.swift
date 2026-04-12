//
// Project: HapticsManager
// Author: Mark Battistella
// Website: https://markbattistella.com
//

import CoreHaptics

extension HapticPreset {

    var continuousEnvelopeAM: ContinuousEnvelope? {
        switch self {
        case .afterglow:
            return nil

        case .aftershock:
            return nil

        case .alarm:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.13,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.01, value: 0.9),
                    .init(time: 0.13, value: 0.0),
                    .init(time: 0.2, value: 0.9),
                    .init(time: 0.33, value: 0.0),
                    .init(time: 0.4, value: 0.9),
                    .init(time: 0.53, value: 0.0),
                    .init(time: 0.6, value: 0.9),
                    .init(time: 0.73, value: 0.0),
                    .init(time: 0.8, value: 0.9),
                    .init(time: 0.93, value: 0.0),
                    .init(time: 1, value: 0.9),
                    .init(time: 1.13, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.82),
                    .init(time: 0.13, value: 0.82),
                    .init(time: 0.2, value: 0.48),
                    .init(time: 0.33, value: 0.48),
                    .init(time: 0.4, value: 0.82),
                    .init(time: 0.53, value: 0.82),
                    .init(time: 0.6, value: 0.48),
                    .init(time: 0.73, value: 0.48),
                    .init(time: 0.8, value: 0.82),
                    .init(time: 0.93, value: 0.82),
                    .init(time: 1, value: 0.48),
                    .init(time: 1.13, value: 0.48)
                ]
            )

        case .anvil:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.5,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 1.0),
                    .init(time: 0.06, value: 0.6),
                    .init(time: 0.15, value: 0.3),
                    .init(time: 0.3, value: 0.1),
                    .init(time: 0.5, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.12),
                    .init(time: 0.005, value: 0.1),
                    .init(time: 0.5, value: 0.08)
                ]
            )

        case .applause:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.564,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.01, value: 0.2),
                    .init(time: 1.482, value: 0.266),
                    .init(time: 1.564, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.5),
                    .init(time: 0.99, value: 0.72),
                    .init(time: 1.25, value: 0.7)
                ]
            )

        case .ascent:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 2.4,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.55),
                    .init(time: 0.155, value: 0.0),
                    .init(time: 0.205, value: 0.65),
                    .init(time: 0.335, value: 0.0),
                    .init(time: 0.385, value: 0.75),
                    .init(time: 0.495, value: 0.0),
                    .init(time: 0.545, value: 0.85),
                    .init(time: 0.635, value: 0.0),
                    .init(time: 0.685, value: 0.92),
                    .init(time: 0.755, value: 0.0),
                    .init(time: 0.805, value: 0.97),
                    .init(time: 0.86, value: 0.0),
                    .init(time: 0.905, value: 1.0),
                    .init(time: 1.7, value: 0.65),
                    .init(time: 2.1, value: 0.25),
                    .init(time: 2.4, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.3),
                    .init(time: 0.2, value: 0.37),
                    .init(time: 0.38, value: 0.42),
                    .init(time: 0.54, value: 0.55),
                    .init(time: 0.68, value: 0.65),
                    .init(time: 0.8, value: 0.73),
                    .init(time: 0.9, value: 0.87),
                    .init(time: 2.4, value: 0.87)
                ]
            )

        case .balloonPop:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.7,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.05, value: 0.1),
                    .init(time: 0.2, value: 0.0),
                    .init(time: 0.3, value: 0.15),
                    .init(time: 0.5, value: 0.0),
                    .init(time: 0.6, value: 0.25),
                    .init(time: 0.8, value: 0.0),
                    .init(time: 0.9, value: 0.35),
                    .init(time: 1.1, value: 0.0),
                    .init(time: 1.2, value: 0.5),
                    .init(time: 1.38, value: 0.0),
                    .init(time: 1.4, value: 1.0),
                    .init(time: 1.44, value: 0.6),
                    .init(time: 1.55, value: 0.1),
                    .init(time: 1.7, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.2),
                    .init(time: 1.38, value: 0.5),
                    .init(time: 1.4, value: 1.0),
                    .init(time: 1.7, value: 0.3)
                ]
            )

        case .barrage:
            return nil

        case .bassDrop:
            return nil

        case .batter:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.38,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.9),
                    .init(time: 0.045, value: 0.35),
                    .init(time: 0.06, value: 0.8),
                    .init(time: 0.102, value: 0.32),
                    .init(time: 0.12, value: 0.93),
                    .init(time: 0.158, value: 0.35),
                    .init(time: 0.175, value: 0.83),
                    .init(time: 0.208, value: 0.38),
                    .init(time: 0.225, value: 1.0),
                    .init(time: 0.38, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.35),
                    .init(time: 0.225, value: 0.38),
                    .init(time: 0.38, value: 0.32)
                ]
            )

        case .bellToll:
            return nil

        case .blip:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.2,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.01, value: 0.5),
                    .init(time: 0.1, value: 0.35),
                    .init(time: 0.2, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.6),
                    .init(time: 0.2, value: 0.58)
                ]
            )

        case .bloom:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.3,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.015, value: 0.28),
                    .init(time: 0.08, value: 0.15),
                    .init(time: 0.12, value: 0.5),
                    .init(time: 0.2, value: 0.15),
                    .init(time: 0.3, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.48),
                    .init(time: 0.2, value: 0.62),
                    .init(time: 0.3, value: 0.58)
                ]
            )

        case .bongo:
            return nil

        case .boulder:
            return nil

        case .breakingWave:
            return nil

        case .breath:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 3.2,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.8, value: 0.5),
                    .init(time: 1.6, value: 0.05),
                    .init(time: 2.4, value: 0.5),
                    .init(time: 3.2, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.15),
                    .init(time: 0.8, value: 0.25),
                    .init(time: 1.6, value: 0.1),
                    .init(time: 2.4, value: 0.25),
                    .init(time: 3.2, value: 0.15)
                ]
            )

        case .buildup:
            return nil

        case .burst:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.3,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.015, value: 0.18),
                    .init(time: 0.08, value: 0.4),
                    .init(time: 0.1, value: 0.85),
                    .init(time: 0.13, value: 0.3),
                    .init(time: 0.3, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.55),
                    .init(time: 0.08, value: 0.65),
                    .init(time: 0.1, value: 0.72),
                    .init(time: 0.3, value: 0.4)
                ]
            )

        case .buzz:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.35,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.9),
                    .init(time: 0.1, value: 0.85),
                    .init(time: 0.15, value: 0.65),
                    .init(time: 0.25, value: 0.3),
                    .init(time: 0.35, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.85),
                    .init(time: 0.35, value: 0.8)
                ]
            )

        case .cadence:
            return nil

        case .cameraShutter:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.15,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.6),
                    .init(time: 0.03, value: 0.05),
                    .init(time: 0.06, value: 0.8),
                    .init(time: 0.1, value: 0.1),
                    .init(time: 0.15, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.78),
                    .init(time: 0.03, value: 0.6),
                    .init(time: 0.06, value: 0.72),
                    .init(time: 0.15, value: 0.65)
                ]
            )

        case .canter:
            return nil

        case .cascade:
            return nil

        case .castanets:
            return nil

        case .catPaw:
            return nil

        case .charge:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 2.046,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.62),
                    .init(time: 0.1, value: 0.35),
                    .init(time: 0.2, value: 0.0),
                    .init(time: 0.9, value: 0.0),
                    .init(time: 0.905, value: 0.85),
                    .init(time: 0.98, value: 0.5),
                    .init(time: 1.1, value: 0.35),
                    .init(time: 1.25, value: 0.0),
                    .init(time: 1.6, value: 0.0),
                    .init(time: 1.603, value: 1.0),
                    .init(time: 1.77, value: 1.0),
                    .init(time: 1.873, value: 0.334),
                    .init(time: 2.046, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.62),
                    .init(time: 0.2, value: 0.6),
                    .init(time: 0.9, value: 0.68),
                    .init(time: 1.25, value: 0.65),
                    .init(time: 1.6, value: 0.82),
                    .init(time: 1.68, value: 0.7),
                    .init(time: 1.86, value: 0.6)
                ]
            )

        case .chime:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.38,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.5),
                    .init(time: 0.07, value: 0.08),
                    .init(time: 0.15, value: 0.0),
                    .init(time: 0.18, value: 0.7),
                    .init(time: 0.26, value: 0.12),
                    .init(time: 0.38, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.48),
                    .init(time: 0.15, value: 0.48),
                    .init(time: 0.18, value: 0.65),
                    .init(time: 0.38, value: 0.6)
                ]
            )

        case .chip:
            return nil

        case .chirp:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.36,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.01, value: 0.35),
                    .init(time: 0.08, value: 0.0),
                    .init(time: 0.15, value: 0.45),
                    .init(time: 0.23, value: 0.0),
                    .init(time: 0.28, value: 0.55),
                    .init(time: 0.36, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.6),
                    .init(time: 0.36, value: 0.72)
                ]
            )

        case .clamor:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.43,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.78),
                    .init(time: 0.07, value: 0.0),
                    .init(time: 0.12, value: 0.78),
                    .init(time: 0.19, value: 0.0),
                    .init(time: 0.24, value: 0.78),
                    .init(time: 0.31, value: 0.0),
                    .init(time: 0.36, value: 0.78),
                    .init(time: 0.43, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.68),
                    .init(time: 0.43, value: 0.68)
                ]
            )

        case .clasp:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.22,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.65),
                    .init(time: 0.045, value: 0.0),
                    .init(time: 0.08, value: 0.9),
                    .init(time: 0.13, value: 0.3),
                    .init(time: 0.22, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.72),
                    .init(time: 0.08, value: 0.78),
                    .init(time: 0.22, value: 0.75)
                ]
            )

        case .cleave:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.25,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.85),
                    .init(time: 0.065, value: 0.0),
                    .init(time: 0.1, value: 0.7),
                    .init(time: 0.165, value: 0.2),
                    .init(time: 0.25, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.8),
                    .init(time: 0.25, value: 0.76)
                ]
            )

        case .coil:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.65,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.05, value: 0.15),
                    .init(time: 0.2, value: 0.2),
                    .init(time: 0.4, value: 0.3),
                    .init(time: 0.57, value: 0.4),
                    .init(time: 0.59, value: 0.0),
                    .init(time: 0.6, value: 1.0),
                    .init(time: 0.65, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.3),
                    .init(time: 0.57, value: 0.5),
                    .init(time: 0.6, value: 0.8),
                    .init(time: 0.65, value: 0.8)
                ]
            )

        case .coinDrop:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.675,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.5),
                    .init(time: 0.035, value: 0.0),
                    .init(time: 0.12, value: 0.7),
                    .init(time: 0.145, value: 0.0),
                    .init(time: 0.21, value: 0.4),
                    .init(time: 0.23, value: 0.0),
                    .init(time: 0.3, value: 0.8),
                    .init(time: 0.325, value: 0.0),
                    .init(time: 0.38, value: 0.35),
                    .init(time: 0.397, value: 0.0),
                    .init(time: 0.46, value: 0.6),
                    .init(time: 0.48, value: 0.0),
                    .init(time: 0.52, value: 0.9),
                    .init(time: 0.55, value: 0.0),
                    .init(time: 0.59, value: 0.45),
                    .init(time: 0.608, value: 0.0),
                    .init(time: 0.65, value: 0.7),
                    .init(time: 0.675, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.8),
                    .init(time: 0.675, value: 0.9)
                ]
            )

        case .combinationLock:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.98,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.004, value: 0.62),
                    .init(time: 0.025, value: 0.0),
                    .init(time: 0.18, value: 0.6),
                    .init(time: 0.201, value: 0.0),
                    .init(time: 0.36, value: 0.63),
                    .init(time: 0.381, value: 0.0),
                    .init(time: 0.54, value: 0.6),
                    .init(time: 0.561, value: 0.0),
                    .init(time: 0.72, value: 0.62),
                    .init(time: 0.741, value: 0.0),
                    .init(time: 0.9, value: 0.9),
                    .init(time: 0.935, value: 0.2),
                    .init(time: 0.98, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.75),
                    .init(time: 0.9, value: 0.75),
                    .init(time: 0.98, value: 0.7)
                ]
            )

        case .crescendo:
            return nil

        case .dewdrop:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.21,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.4),
                    .init(time: 0.065, value: 0.0),
                    .init(time: 0.13, value: 0.6),
                    .init(time: 0.21, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.5),
                    .init(time: 0.13, value: 0.65),
                    .init(time: 0.21, value: 0.62)
                ]
            )

        case .dirge:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 2.6,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.03, value: 0.4),
                    .init(time: 0.3, value: 0.2),
                    .init(time: 0.7, value: 0.0),
                    .init(time: 0.9, value: 0.0),
                    .init(time: 0.93, value: 0.38),
                    .init(time: 1.2, value: 0.18),
                    .init(time: 1.7, value: 0.0),
                    .init(time: 1.9, value: 0.0),
                    .init(time: 1.93, value: 0.32),
                    .init(time: 2.2, value: 0.12),
                    .init(time: 2.6, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.14),
                    .init(time: 2.6, value: 0.11)
                ]
            )

        case .dissolve:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.2,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.05, value: 0.38),
                    .init(time: 0.3, value: 0.28),
                    .init(time: 0.6, value: 0.2),
                    .init(time: 0.9, value: 0.12),
                    .init(time: 1.2, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.38),
                    .init(time: 1.2, value: 0.18)
                ]
            )

        case .dogBark:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.5,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.9),
                    .init(time: 0.05, value: 0.65),
                    .init(time: 0.12, value: 0.15),
                    .init(time: 0.2, value: 0.0),
                    .init(time: 0.28, value: 0.85),
                    .init(time: 0.325, value: 0.6),
                    .init(time: 0.4, value: 0.12),
                    .init(time: 0.5, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.2),
                    .init(time: 0.5, value: 0.2)
                ]
            )

        case .drone:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.78,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.02, value: 0.28),
                    .init(time: 0.18, value: 0.28),
                    .init(time: 0.28, value: 0.0),
                    .init(time: 0.5, value: 0.0),
                    .init(time: 0.52, value: 0.28),
                    .init(time: 0.68, value: 0.28),
                    .init(time: 0.78, value: 0.0),
                    .init(time: 1, value: 0.0),
                    .init(time: 1.02, value: 0.28),
                    .init(time: 1.18, value: 0.28),
                    .init(time: 1.28, value: 0.0),
                    .init(time: 1.5, value: 0.0),
                    .init(time: 1.52, value: 0.28),
                    .init(time: 1.68, value: 0.28),
                    .init(time: 1.78, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.45),
                    .init(time: 1.78, value: 0.45)
                ]
            )

        case .engineRev:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.8,
                amplitudePoints: [
                    .init(time: 0, value: 0.15),
                    .init(time: 0.7, value: 0.75),
                    .init(time: 0.71, value: 0.2),
                    .init(time: 0.72, value: 0.25),
                    .init(time: 1.4, value: 0.95),
                    .init(time: 1.6, value: 0.5),
                    .init(time: 1.8, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.08),
                    .init(time: 0.7, value: 0.45),
                    .init(time: 0.72, value: 0.12),
                    .init(time: 1.4, value: 0.55),
                    .init(time: 1.8, value: 0.3)
                ]
            )

        case .exhale:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.2,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.01, value: 0.6),
                    .init(time: 0.1, value: 0.4),
                    .init(time: 0.2, value: 0.25),
                    .init(time: 0.5, value: 0.2),
                    .init(time: 0.8, value: 0.15),
                    .init(time: 1.2, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.6),
                    .init(time: 0.2, value: 0.28),
                    .init(time: 1.2, value: 0.15)
                ]
            )

        case .explosion:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 1.0),
                    .init(time: 0.08, value: 0.7),
                    .init(time: 0.2, value: 0.5),
                    .init(time: 0.4, value: 0.3),
                    .init(time: 0.7, value: 0.1),
                    .init(time: 1, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.2),
                    .init(time: 0.005, value: 0.15),
                    .init(time: 1, value: 0.05)
                ]
            )

        case .fadeOut:
            return nil

        case .fanfare:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.58,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.6),
                    .init(time: 0.08, value: 0.0),
                    .init(time: 0.13, value: 0.7),
                    .init(time: 0.2, value: 0.0),
                    .init(time: 0.25, value: 0.8),
                    .init(time: 0.315, value: 0.0),
                    .init(time: 0.36, value: 1.0),
                    .init(time: 0.46, value: 0.5),
                    .init(time: 0.58, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.38),
                    .init(time: 0.13, value: 0.52),
                    .init(time: 0.25, value: 0.62),
                    .init(time: 0.36, value: 0.78),
                    .init(time: 0.58, value: 0.82)
                ]
            )

        case .feather:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.18,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.01, value: 0.45),
                    .init(time: 0.07, value: 0.15),
                    .init(time: 0.18, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.42),
                    .init(time: 0.18, value: 0.38)
                ]
            )

        case .finale:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.68,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.7),
                    .init(time: 0.075, value: 0.0),
                    .init(time: 0.2, value: 0.7),
                    .init(time: 0.275, value: 0.0),
                    .init(time: 0.4, value: 0.9),
                    .init(time: 0.52, value: 0.3),
                    .init(time: 0.68, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.55),
                    .init(time: 0.4, value: 0.65),
                    .init(time: 0.68, value: 0.6)
                ]
            )

        case .fingerDrum:
            return nil

        case .firecracker:
            return nil

        case .fizz:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.5,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.5),
                    .init(time: 0.06, value: 0.15),
                    .init(time: 0.12, value: 0.6),
                    .init(time: 0.178, value: 0.1),
                    .init(time: 0.23, value: 0.7),
                    .init(time: 0.29, value: 0.15),
                    .init(time: 0.33, value: 0.75),
                    .init(time: 0.39, value: 0.2),
                    .init(time: 0.42, value: 0.65),
                    .init(time: 0.5, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.62),
                    .init(time: 0.42, value: 0.72),
                    .init(time: 0.5, value: 0.68)
                ]
            )

        case .flare:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.38,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.02, value: 0.18),
                    .init(time: 0.06, value: 0.52),
                    .init(time: 0.09, value: 0.95),
                    .init(time: 0.1, value: 1.0),
                    .init(time: 0.12, value: 0.75),
                    .init(time: 0.14, value: 0.65),
                    .init(time: 0.2, value: 0.35),
                    .init(time: 0.38, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.7),
                    .init(time: 0.06, value: 0.82),
                    .init(time: 0.1, value: 0.92),
                    .init(time: 0.2, value: 0.75),
                    .init(time: 0.38, value: 0.6)
                ]
            )

        case .flick:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.08,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.006, value: 0.4),
                    .init(time: 0.045, value: 0.05),
                    .init(time: 0.08, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.5),
                    .init(time: 0.08, value: 0.5)
                ]
            )

        case .flinch:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.28,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.004, value: 0.95),
                    .init(time: 0.06, value: 0.3),
                    .init(time: 0.12, value: 0.8),
                    .init(time: 0.17, value: 0.4),
                    .init(time: 0.28, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.73),
                    .init(time: 0.12, value: 0.68),
                    .init(time: 0.28, value: 0.55)
                ]
            )

        case .flourish:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.65,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.05, value: 0.2),
                    .init(time: 0.2, value: 0.65),
                    .init(time: 0.38, value: 0.95),
                    .init(time: 0.48, value: 0.5),
                    .init(time: 0.65, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.43),
                    .init(time: 0.38, value: 0.78),
                    .init(time: 0.65, value: 0.65)
                ]
            )

        case .flurry:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.3,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.45),
                    .init(time: 0.04, value: 0.0),
                    .init(time: 0.06, value: 0.55),
                    .init(time: 0.095, value: 0.0),
                    .init(time: 0.115, value: 0.65),
                    .init(time: 0.148, value: 0.0),
                    .init(time: 0.165, value: 0.82),
                    .init(time: 0.24, value: 0.1),
                    .init(time: 0.3, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.55),
                    .init(time: 0.165, value: 0.72),
                    .init(time: 0.3, value: 0.7)
                ]
            )

        case .flush:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.38,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.03, value: 0.22),
                    .init(time: 0.08, value: 0.45),
                    .init(time: 0.1, value: 0.78),
                    .init(time: 0.14, value: 0.52),
                    .init(time: 0.2, value: 0.2),
                    .init(time: 0.38, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.3),
                    .init(time: 0.1, value: 0.35),
                    .init(time: 0.15, value: 0.28),
                    .init(time: 0.38, value: 0.22)
                ]
            )

        case .gallop:
            return nil

        case .gavel:
            return nil

        case .glitch:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.22,
                amplitudePoints: [
                    .init(time: 0, value: 0.9),
                    .init(time: 0.02, value: 0.1),
                    .init(time: 0.055, value: 1.0),
                    .init(time: 0.065, value: 0.0),
                    .init(time: 0.1, value: 0.85),
                    .init(time: 0.118, value: 0.0),
                    .init(time: 0.16, value: 0.95),
                    .init(time: 0.175, value: 0.15),
                    .init(time: 0.22, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.9),
                    .init(time: 0.02, value: 0.2),
                    .init(time: 0.055, value: 1.0),
                    .init(time: 0.065, value: 0.1),
                    .init(time: 0.1, value: 0.88),
                    .init(time: 0.118, value: 0.15),
                    .init(time: 0.16, value: 0.92),
                    .init(time: 0.22, value: 0.3)
                ]
            )

        case .guitarStrum:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.4,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.9),
                    .init(time: 0.06, value: 0.65),
                    .init(time: 0.2, value: 0.45),
                    .init(time: 0.45, value: 0.28),
                    .init(time: 0.75, value: 0.14),
                    .init(time: 1.1, value: 0.05),
                    .init(time: 1.4, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.58),
                    .init(time: 0.005, value: 0.55),
                    .init(time: 1.4, value: 0.52)
                ]
            )

        case .hail:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.43,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.01, value: 0.3),
                    .init(time: 0.4, value: 0.3),
                    .init(time: 0.43, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.7),
                    .init(time: 0.43, value: 0.7)
                ]
            )

        case .hammer:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.05,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.75),
                    .init(time: 0.09, value: 0.05),
                    .init(time: 0.18, value: 0.0),
                    .init(time: 0.22, value: 0.8),
                    .init(time: 0.31, value: 0.05),
                    .init(time: 0.38, value: 0.0),
                    .init(time: 0.42, value: 0.88),
                    .init(time: 0.508, value: 0.05),
                    .init(time: 0.55, value: 0.0),
                    .init(time: 0.59, value: 0.92),
                    .init(time: 0.678, value: 0.05),
                    .init(time: 0.71, value: 0.0),
                    .init(time: 0.74, value: 1.0),
                    .init(time: 0.816, value: 0.05),
                    .init(time: 0.84, value: 0.0),
                    .init(time: 0.87, value: 1.0),
                    .init(time: 0.95, value: 0.05),
                    .init(time: 1.05, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.28),
                    .init(time: 1.05, value: 0.28)
                ]
            )

        case .heartbeat:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.01, value: 0.8),
                    .init(time: 0.08, value: 0.0),
                    .init(time: 0.12, value: 0.5),
                    .init(time: 0.2, value: 0.0),
                    .init(time: 0.8, value: 0.0),
                    .init(time: 0.81, value: 0.8),
                    .init(time: 0.88, value: 0.0),
                    .init(time: 0.92, value: 0.5),
                    .init(time: 1, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.2),
                    .init(time: 1, value: 0.2)
                ]
            )

        case .herald:
            return nil

        case .hoofBeat:
            return nil

        case .ignition:
            return nil

        case .impact:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.2,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.85),
                    .init(time: 0.06, value: 0.35),
                    .init(time: 0.12, value: 0.15),
                    .init(time: 0.2, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.6),
                    .init(time: 0.2, value: 0.35)
                ]
            )

        case .jolt:
            return nil

        case .keyboardMechanical:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.055,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.004, value: 0.52),
                    .init(time: 0.018, value: 0.2),
                    .init(time: 0.022, value: 0.7),
                    .init(time: 0.038, value: 0.15),
                    .init(time: 0.055, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.68),
                    .init(time: 0.022, value: 0.76),
                    .init(time: 0.055, value: 0.7)
                ]
            )

        case .keyboardMembrane:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.14,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.012, value: 0.33),
                    .init(time: 0.05, value: 0.18),
                    .init(time: 0.1, value: 0.06),
                    .init(time: 0.14, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.38),
                    .init(time: 0.14, value: 0.35)
                ]
            )

        case .knell:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.55,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.9),
                    .init(time: 0.2, value: 0.5),
                    .init(time: 0.3, value: 0.1),
                    .init(time: 0.35, value: 0.5),
                    .init(time: 0.43, value: 0.1),
                    .init(time: 0.55, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.58),
                    .init(time: 0.3, value: 0.52),
                    .init(time: 0.55, value: 0.48)
                ]
            )

        case .knock:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.76,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.65),
                    .init(time: 0.07, value: 0.08),
                    .init(time: 0.2, value: 0.0),
                    .init(time: 0.28, value: 0.65),
                    .init(time: 0.348, value: 0.08),
                    .init(time: 0.48, value: 0.0),
                    .init(time: 0.56, value: 0.65),
                    .init(time: 0.628, value: 0.08),
                    .init(time: 0.76, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.32),
                    .init(time: 0.76, value: 0.32)
                ]
            )

        case .lament:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 2.45,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.85),
                    .init(time: 0.19, value: 0.3),
                    .init(time: 0.295, value: 0.0),
                    .init(time: 0.355, value: 0.7),
                    .init(time: 0.535, value: 0.25),
                    .init(time: 0.645, value: 0.0),
                    .init(time: 0.705, value: 0.55),
                    .init(time: 0.88, value: 0.18),
                    .init(time: 0.995, value: 0.0),
                    .init(time: 1.055, value: 0.75),
                    .init(time: 1.62, value: 0.35),
                    .init(time: 2.15, value: 0.1),
                    .init(time: 2.45, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.55),
                    .init(time: 0.35, value: 0.42),
                    .init(time: 0.7, value: 0.37),
                    .init(time: 1.05, value: 0.3),
                    .init(time: 2.45, value: 0.26)
                ]
            )

        case .latch:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.23,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.005, value: 0.72),
                    .init(time: 0.06, value: 0.15),
                    .init(time: 0.1, value: 0.38),
                    .init(time: 0.17, value: 0.08),
                    .init(time: 0.23, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.68),
                    .init(time: 0.1, value: 0.45),
                    .init(time: 0.23, value: 0.42)
                ]
            )

        case .lighthouse:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 1.05,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.015, value: 0.4),
                    .init(time: 0.15, value: 0.4),
                    .init(time: 0.25, value: 0.0),
                    .init(time: 0.4, value: 0.0),
                    .init(time: 0.415, value: 0.4),
                    .init(time: 0.55, value: 0.4),
                    .init(time: 0.65, value: 0.0),
                    .init(time: 0.8, value: 0.0),
                    .init(time: 0.815, value: 0.4),
                    .init(time: 0.95, value: 0.4),
                    .init(time: 1.05, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.5),
                    .init(time: 1.05, value: 0.5)
                ]
            )

        case .lilt:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.36,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.008, value: 0.45),
                    .init(time: 0.072, value: 0.0),
                    .init(time: 0.16, value: 0.65),
                    .init(time: 0.24, value: 0.12),
                    .init(time: 0.36, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.5),
                    .init(time: 0.16, value: 0.65),
                    .init(time: 0.36, value: 0.6)
                ]
            )

        case .lock:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.22,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.01, value: 0.25),
                    .init(time: 0.1, value: 0.15),
                    .init(time: 0.14, value: 0.0),
                    .init(time: 0.15, value: 0.9),
                    .init(time: 0.175, value: 0.2),
                    .init(time: 0.22, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.4),
                    .init(time: 0.14, value: 0.5),
                    .init(time: 0.15, value: 0.75),
                    .init(time: 0.22, value: 0.6)
                ]
            )

        case .lope:
            return ContinuousEnvelope(
                startTime: 0,
                duration: 0.45,
                amplitudePoints: [
                    .init(time: 0, value: 0.0),
                    .init(time: 0.006, value: 0.68),
                    .init(time: 0.06, value: 0.15),
                    .init(time: 0.08, value: 0.43),
                    .init(time: 0.14, value: 0.12),
                    .init(time: 0.16, value: 0.68),
                    .init(time: 0.22, value: 0.15),
                    .init(time: 0.24, value: 0.43),
                    .init(time: 0.3, value: 0.12),
                    .init(time: 0.32, value: 0.73),
                    .init(time: 0.45, value: 0.0)
                ],
                frequencyPoints: [
                    .init(time: 0, value: 0.72),
                    .init(time: 0.45, value: 0.7)
                ]
            )

        default:
            return nil
        }
    }
}
