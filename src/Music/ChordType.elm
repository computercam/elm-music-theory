module Music.ChordType exposing
    ( ChordType
    , containsInterval
    , toIntervals, symbol
    , major, minor, augmented, diminished, sus2, sus4
    , majorSix, majorSixNine, minorSix, minorSixNine, majorAddNine, minorAddNine
    , majorSeventh, majorSeventhSharpEleven, minorSeventh, dominantSeventh, diminishedSeventh, halfDiminishedSeventh, augmentedDominantSeventh, dominantSeventhSus4, minorMajorSeventh
    , majorNinth, minorNinth, dominantNinth, minorEleventh, dominantEleventh, dominantThirteenth
    , dominantSeventhFlatNine, dominantSeventhSharpNine, dominantSeventhFlatNineSharpNine, dominantSeventhFlatNineSharpEleven, dominantSeventhSharpNineSharpEleven, dominantSeventhSharpEleven, dominantSeventhFlatNineFlatThirteen, dominantSeventhSharpNineFlatThirteen, dominantSeventhSharpElevenFlatThirteen
    , custom
    , withMajorThird, withMinorThird, withSuspendedSecond, withSuspendedFourth, withFifth, withFlatFifth, withSharpFifth, withSixth, withDiminishedSeventh, withMinorSeventh, withMajorSeventh, withNinth, withFlatNinth, withSharpNinth, withEleventh, withSharpEleventh, withThirteenth, withFlatThirteenth
    )

{-| A [chord type](https://en.wikipedia.org/wiki/Chord_%28music%29#Common_types_of_chords) describes the intervals contained in a chord, with no specific root pitch class.

@docs ChordType


# Helpers

@docs containsInterval


# Conversion

@docs toIntervals, symbol


# Constructors


## Triads

@docs major, minor, augmented, diminished, sus2, sus4


## Added-tone chords

@docs majorSix, majorSixNine, minorSix, minorSixNine, majorAddNine, minorAddNine


## Seventh chords

@docs majorSeventh, majorSeventhSharpEleven, minorSeventh, dominantSeventh, diminishedSeventh, halfDiminishedSeventh, augmentedDominantSeventh, dominantSeventhSus4, minorMajorSeventh


## Chords with extensions

@docs majorNinth, minorNinth, dominantNinth, minorEleventh, dominantEleventh, dominantThirteenth


## Altered dominant chords

@docs dominantSeventhFlatNine, dominantSeventhSharpNine, dominantSeventhFlatNineSharpNine, dominantSeventhFlatNineSharpEleven, dominantSeventhSharpNineSharpEleven, dominantSeventhSharpEleven, dominantSeventhFlatNineFlatThirteen, dominantSeventhSharpNineFlatThirteen, dominantSeventhSharpElevenFlatThirteen


# Custom chord types

@docs custom
@docs withMajorThird, withMinorThird, withSuspendedSecond, withSuspendedFourth, withFifth, withFlatFifth, withSharpFifth, withSixth, withDiminishedSeventh, withMinorSeventh, withMajorSeventh, withNinth, withFlatNinth, withSharpNinth, withEleventh, withSharpEleventh, withThirteenth, withFlatThirteenth

-}

import Music.Internal.ChordType as ChordType
import Music.Internal.Interval as Interval


{-| -}
type alias ChordType =
    ChordType.ChordType


{-| Determine whether a chord type contains a given interval:

    containsInterval Interval.diminishedFifth halfDiminishedSeventh == True

-}
containsInterval : Interval.Interval -> ChordType.ChordType -> Bool
containsInterval interval theChordType =
    ChordType.includes interval theChordType


{-| Get the intervals contained in a chord type:

    toIntervals minor
        == [ Interval.perfectUnison
           , Interval.minorThird
           , Interval.perfectFifth
           ]

-}
toIntervals : ChordType -> List Interval.Interval
toIntervals chordType =
    ChordType.toIntervals chordType


{-| Get the chord symbol for a chord type:

    symbol majorSeventh == "M7"

-}
symbol : ChordType -> String
symbol chordType =
    ChordType.symbol chordType


{-| -}
major : ChordType
major =
    ChordType.major


{-| -}
minor : ChordType
minor =
    ChordType.minor


{-| -}
augmented : ChordType
augmented =
    ChordType.augmented


{-| -}
diminished : ChordType
diminished =
    ChordType.diminished


{-| -}
sus2 : ChordType
sus2 =
    ChordType.sus2


{-| -}
sus4 : ChordType
sus4 =
    ChordType.sus4


{-| -}
majorSix : ChordType
majorSix =
    ChordType.majorSix


{-| -}
majorSixNine : ChordType
majorSixNine =
    ChordType.majorSixNine


{-| -}
minorSix : ChordType
minorSix =
    ChordType.minorSix


{-| -}
minorSixNine : ChordType
minorSixNine =
    ChordType.minorSixNine


{-| -}
majorAddNine : ChordType
majorAddNine =
    ChordType.majorAddNine


{-| -}
minorAddNine : ChordType
minorAddNine =
    ChordType.minorAddNine


{-| -}
majorSeventh : ChordType
majorSeventh =
    ChordType.majorSeventh


{-| -}
minorSeventh : ChordType
minorSeventh =
    ChordType.minorSeventh


{-| -}
dominantSeventh : ChordType
dominantSeventh =
    ChordType.dominantSeventh


{-| -}
diminishedSeventh : ChordType
diminishedSeventh =
    ChordType.diminishedSeventh


{-| -}
halfDiminishedSeventh : ChordType
halfDiminishedSeventh =
    ChordType.halfDiminished


{-| -}
majorSeventhSharpEleven : ChordType
majorSeventhSharpEleven =
    ChordType.majorSeventhSharpEleven


{-| -}
minorMajorSeventh : ChordType
minorMajorSeventh =
    ChordType.minorMajorSeventh


{-| -}
majorNinth : ChordType
majorNinth =
    ChordType.majorNinth


{-| -}
minorNinth : ChordType
minorNinth =
    ChordType.minorNinth


{-| -}
dominantNinth : ChordType
dominantNinth =
    ChordType.dominantNinth


{-| -}
minorEleventh : ChordType
minorEleventh =
    ChordType.minorEleventh


{-| -}
dominantEleventh : ChordType
dominantEleventh =
    ChordType.dominantEleventh


{-| -}
dominantThirteenth : ChordType
dominantThirteenth =
    ChordType.dominantThirteenth


{-| -}
augmentedDominantSeventh : ChordType
augmentedDominantSeventh =
    ChordType.augmentedDominantSeventh


{-| -}
dominantSeventhSus4 : ChordType
dominantSeventhSus4 =
    ChordType.dominantSeventhSus4


{-| -}
dominantSeventhFlatNine : ChordType
dominantSeventhFlatNine =
    ChordType.dominantSeventhFlatNine


{-| -}
dominantSeventhSharpNine : ChordType
dominantSeventhSharpNine =
    ChordType.dominantSeventhSharpNine


{-| -}
dominantSeventhFlatNineSharpNine : ChordType
dominantSeventhFlatNineSharpNine =
    ChordType.dominantSeventhFlatNineSharpNine


{-| -}
dominantSeventhFlatNineSharpEleven : ChordType
dominantSeventhFlatNineSharpEleven =
    ChordType.dominantSeventhFlatNineSharpEleven


{-| -}
dominantSeventhSharpNineSharpEleven : ChordType
dominantSeventhSharpNineSharpEleven =
    ChordType.dominantSeventhSharpNineSharpEleven


{-| -}
dominantSeventhSharpEleven : ChordType
dominantSeventhSharpEleven =
    ChordType.dominantSeventhSharpEleven


{-| -}
dominantSeventhFlatNineFlatThirteen : ChordType
dominantSeventhFlatNineFlatThirteen =
    ChordType.dominantSeventhFlatNineFlatThirteen


{-| -}
dominantSeventhSharpNineFlatThirteen : ChordType
dominantSeventhSharpNineFlatThirteen =
    ChordType.dominantSeventhSharpNineFlatThirteen


{-| -}
dominantSeventhSharpElevenFlatThirteen : ChordType
dominantSeventhSharpElevenFlatThirteen =
    ChordType.dominantSeventhSharpElevenFlatThirteen



--


{-| Define a custom chord type. Start with `custom` and apply the chord factor functions below:

    custom
        |> withMinorThird
        |> withDiminishedFifth
        |> withMinorSeventh
    -- equivalent to `halfDiminishedSeventh`

Note: because there is no unified model for naming any given chord, your custom chord may not work with the `symbol` function in this module.

-}
custom : ChordType
custom =
    ChordType.custom


{-| -}
withMajorThird : ChordType -> ChordType
withMajorThird chordType =
    ChordType.withMajorThird chordType


{-| -}
withMinorThird : ChordType -> ChordType
withMinorThird chordType =
    ChordType.withMinorThird chordType


{-| -}
withSuspendedSecond : ChordType -> ChordType
withSuspendedSecond chordType =
    ChordType.withSuspendedSecond chordType


{-| -}
withSuspendedFourth : ChordType -> ChordType
withSuspendedFourth chordType =
    ChordType.withSuspendedFourth chordType


{-| -}
withFifth : ChordType -> ChordType
withFifth chordType =
    ChordType.withFifth chordType


{-| -}
withFlatFifth : ChordType -> ChordType
withFlatFifth chordType =
    ChordType.withFlatFifth chordType


{-| -}
withSharpFifth : ChordType -> ChordType
withSharpFifth chordType =
    ChordType.withSharpFifth chordType


{-| -}
withSixth : ChordType -> ChordType
withSixth chordType =
    ChordType.withSixth chordType


{-| -}
withDiminishedSeventh : ChordType -> ChordType
withDiminishedSeventh chordType =
    ChordType.withDiminishedSeventh chordType


{-| -}
withMinorSeventh : ChordType -> ChordType
withMinorSeventh chordType =
    ChordType.withMinorSeventh chordType


{-| -}
withMajorSeventh : ChordType -> ChordType
withMajorSeventh chordType =
    ChordType.withMajorSeventh chordType


{-| -}
withNinth : ChordType -> ChordType
withNinth chordType =
    ChordType.withNinth chordType


{-| -}
withFlatNinth : ChordType -> ChordType
withFlatNinth chordType =
    ChordType.withFlatNinth chordType


{-| -}
withSharpNinth : ChordType -> ChordType
withSharpNinth chordType =
    ChordType.withSharpNinth chordType


{-| -}
withEleventh : ChordType -> ChordType
withEleventh chordType =
    ChordType.withEleventh chordType


{-| -}
withSharpEleventh : ChordType -> ChordType
withSharpEleventh chordType =
    ChordType.withSharpEleventh chordType


{-| -}
withThirteenth : ChordType -> ChordType
withThirteenth chordType =
    ChordType.withThirteenth chordType


{-| -}
withFlatThirteenth : ChordType -> ChordType
withFlatThirteenth chordType =
    ChordType.withFlatThirteenth chordType