module Music.Range exposing
    ( Range
    , range
    , isWithin
    , sopranoVoice, altoVoice, tenorVoice, bassVoice
    , violin, viola, cello
    )

{-| A range, like a range of numbers, represents an upper and lower boundary and all the pitches in between.

@docs Range


# Constructor

@docs range


# Helpers

@docs isWithin


# Common instrument ranges

All instrument ranges here are defined in [concert pitch](https://en.wikipedia.org/wiki/Concert_pitch).


## Vocal ranges

@docs sopranoVoice, altoVoice, tenorVoice, bassVoice


## Stringed instruments

@docs violin, viola, cello

-}

import Music.Internal.InstrumentRanges as InstrumentRanges
import Music.Internal.Pitch as Pitch


{-| -}
type alias Range =
    Pitch.Range


{-| Construct a range:

    range Pitch.c4 Pitch.c6

-}
range : Pitch.Pitch -> Pitch.Pitch -> Range
range lower upper =
    Pitch.range lower upper


{-| Find out whether a pitch lies within a range, inclusive of its boundaries.

    isWithin (range Pitch.c4 Pitch.c6) Pitch.c5 == True

-}
isWithin : Range -> Pitch.Pitch -> Bool
isWithin theRange thePitch =
    Pitch.isWithin theRange thePitch



-- Common instrument ranges


{-| -}
sopranoVoice : Range
sopranoVoice =
    InstrumentRanges.sopranoVoice


{-| -}
altoVoice : Range
altoVoice =
    InstrumentRanges.altoVoice


{-| -}
tenorVoice : Range
tenorVoice =
    InstrumentRanges.tenorVoice


{-| -}
bassVoice : Range
bassVoice =
    InstrumentRanges.bassVoice


{-| -}
violin : Range
violin =
    InstrumentRanges.violin


{-| -}
viola : Range
viola =
    InstrumentRanges.viola


{-| -}
cello : Range
cello =
    InstrumentRanges.cello
