module MusicTheory.Internal.Scale exposing
    ( Scale
    , containsPitchClass
    , degree
    , root
    , scale
    , toList
    , toListThroughAllOctaves
    )

import MusicTheory.Internal.Octave as Octave
import MusicTheory.Internal.Pitch as Pitch exposing (Pitch)
import MusicTheory.Internal.PitchClass as PitchClass exposing (PitchClass)
import MusicTheory.Internal.ScaleType as ScaleType exposing (ScaleType)
import Util.Basic


type Scale
    = Scale PitchClass ScaleType


type ScaleDegrees
    = Pentatonic PentatonicDegrees
    | Hexatonic HexatonicDegrees
    | Heptatonic HeptatonicDegrees
    | Octatonic OctatonicDegrees


type alias PentatonicDegrees =
    { root : PitchClass
    , second : PitchClass
    , third : PitchClass
    , fourth : PitchClass
    , fifth : PitchClass
    }


type alias HexatonicDegrees =
    { root : PitchClass
    , second : PitchClass
    , third : PitchClass
    , fourth : PitchClass
    , fifth : PitchClass
    , sixth : PitchClass
    }


type alias HeptatonicDegrees =
    { root : PitchClass
    , second : PitchClass
    , third : PitchClass
    , fourth : PitchClass
    , fifth : PitchClass
    , sixth : PitchClass
    , seventh : PitchClass
    }


type alias OctatonicDegrees =
    { root : PitchClass
    , second : PitchClass
    , third : PitchClass
    , fourth : PitchClass
    , fifth : PitchClass
    , sixth : PitchClass
    , seventh : PitchClass
    , eighth : PitchClass
    }


scale : PitchClass -> ScaleType -> Scale
scale scaleRoot scaleType =
    Scale scaleRoot scaleType


root : Scale -> PitchClass
root (Scale scaleRoot _) =
    scaleRoot


toListThroughAllOctaves : Scale -> List Pitch
toListThroughAllOctaves (Scale scaleRoot scaleType) =
    Octave.allValid
        |> List.take 8
        |> List.concatMap
            (\octave ->
                let
                    tonic =
                        Pitch.fromPitchClass octave scaleRoot
                in
                ScaleType.toList scaleType
                    |> List.map
                        (\interval ->
                            Pitch.transposeUp interval tonic
                        )
            )


containsPitchClass : PitchClass -> Scale -> { ignoreSpelling : Bool } -> Bool
containsPitchClass thePitchClass theScale { ignoreSpelling } =
    if ignoreSpelling then
        List.member (PitchClass.semitones thePitchClass) (toList theScale |> List.map PitchClass.semitones)

    else
        List.member thePitchClass (toList theScale)


toList : Scale -> List PitchClass
toList theScale =
    case toScaleDegrees theScale of
        Pentatonic scaleDegrees ->
            [ scaleDegrees.root
            , scaleDegrees.second
            , scaleDegrees.third
            , scaleDegrees.fourth
            , scaleDegrees.fifth
            ]

        Hexatonic scaleDegrees ->
            [ scaleDegrees.root
            , scaleDegrees.second
            , scaleDegrees.third
            , scaleDegrees.fourth
            , scaleDegrees.fifth
            , scaleDegrees.sixth
            ]

        Heptatonic scaleDegrees ->
            [ scaleDegrees.root
            , scaleDegrees.second
            , scaleDegrees.third
            , scaleDegrees.fourth
            , scaleDegrees.fifth
            , scaleDegrees.sixth
            , scaleDegrees.seventh
            ]

        Octatonic scaleDegrees ->
            [ scaleDegrees.root
            , scaleDegrees.second
            , scaleDegrees.third
            , scaleDegrees.fourth
            , scaleDegrees.fifth
            , scaleDegrees.sixth
            , scaleDegrees.seventh
            , scaleDegrees.eighth
            ]


degree : Int -> Scale -> PitchClass
degree degreeNumber theScale =
    let
        shift theList =
            case theList of
                [] ->
                    []

                head :: tail ->
                    tail ++ [ head ]
    in
    toList theScale
        |> Util.Basic.applyNTimes (degreeNumber - 1) shift
        |> List.head
        |> Maybe.withDefault PitchClass.bDoubleFlat


toScaleDegrees : Scale -> ScaleDegrees
toScaleDegrees (Scale scaleRoot scaleType) =
    case scaleType of
        ScaleType.Pentatonic scaleTypeIntervals ->
            Pentatonic
                { root = scaleRoot
                , second = PitchClass.transpose scaleTypeIntervals.rootToSecond scaleRoot
                , third = PitchClass.transpose scaleTypeIntervals.rootToThird scaleRoot
                , fourth = PitchClass.transpose scaleTypeIntervals.rootToFourth scaleRoot
                , fifth = PitchClass.transpose scaleTypeIntervals.rootToFifth scaleRoot
                }

        ScaleType.Hexatonic scaleTypeIntervals ->
            Hexatonic
                { root = scaleRoot
                , second = PitchClass.transpose scaleTypeIntervals.rootToSecond scaleRoot
                , third = PitchClass.transpose scaleTypeIntervals.rootToThird scaleRoot
                , fourth = PitchClass.transpose scaleTypeIntervals.rootToFourth scaleRoot
                , fifth = PitchClass.transpose scaleTypeIntervals.rootToFifth scaleRoot
                , sixth = PitchClass.transpose scaleTypeIntervals.rootToSixth scaleRoot
                }

        ScaleType.Heptatonic scaleTypeIntervals ->
            Heptatonic
                { root = scaleRoot
                , second = PitchClass.transpose scaleTypeIntervals.rootToSecond scaleRoot
                , third = PitchClass.transpose scaleTypeIntervals.rootToThird scaleRoot
                , fourth = PitchClass.transpose scaleTypeIntervals.rootToFourth scaleRoot
                , fifth = PitchClass.transpose scaleTypeIntervals.rootToFifth scaleRoot
                , sixth = PitchClass.transpose scaleTypeIntervals.rootToSixth scaleRoot
                , seventh = PitchClass.transpose scaleTypeIntervals.rootToSeventh scaleRoot
                }

        ScaleType.Octatonic scaleTypeIntervals ->
            Octatonic
                { root = scaleRoot
                , second = PitchClass.transpose scaleTypeIntervals.rootToSecond scaleRoot
                , third = PitchClass.transpose scaleTypeIntervals.rootToThird scaleRoot
                , fourth = PitchClass.transpose scaleTypeIntervals.rootToFourth scaleRoot
                , fifth = PitchClass.transpose scaleTypeIntervals.rootToFifth scaleRoot
                , sixth = PitchClass.transpose scaleTypeIntervals.rootToSixth scaleRoot
                , seventh = PitchClass.transpose scaleTypeIntervals.rootToSeventh scaleRoot
                , eighth = PitchClass.transpose scaleTypeIntervals.rootToEighth scaleRoot
                }
