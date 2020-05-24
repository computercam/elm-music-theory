module Test.Voicing.FourPart exposing (..)

import Expect
import MusicTheory.Interval as Interval
import MusicTheory.Pitch as Pitch
import MusicTheory.Voicing as Voicing
import MusicTheory.Voicing.FourPart as FourPart
import Test exposing (..)


all : Test
all =
    describe "all"
        [ describe "commonTones"
            [ test "should return three common tones between a Cmaj6 and a Cmaj7" <|
                \_ ->
                    let
                        voicingA =
                            Voicing.fourPart
                                Pitch.c4
                                { voiceOne = Interval.perfectUnison
                                , voiceTwo = Interval.majorThird
                                , voiceThree = Interval.perfectFifth
                                , voiceFour = Interval.majorSeventh
                                }

                        voicingB =
                            Voicing.fourPart
                                Pitch.c4
                                { voiceOne = Interval.perfectUnison
                                , voiceTwo = Interval.majorThird
                                , voiceThree = Interval.perfectFifth
                                , voiceFour = Interval.majorSixth
                                }

                        result =
                            FourPart.commonTones voicingA voicingB

                        expected =
                            3
                    in
                    Expect.equal expected result
            , test "should return no common tones between seventh chords a step apart" <|
                \_ ->
                    let
                        voicingA =
                            Voicing.fourPart
                                Pitch.c4
                                { voiceOne = Interval.perfectUnison
                                , voiceTwo = Interval.majorThird
                                , voiceThree = Interval.perfectFifth
                                , voiceFour = Interval.majorSeventh
                                }

                        voicingB =
                            Voicing.fourPart
                                Pitch.d4
                                { voiceOne = Interval.perfectUnison
                                , voiceTwo = Interval.minorThird
                                , voiceThree = Interval.perfectFifth
                                , voiceFour = Interval.minorSeventh
                                }

                        result =
                            FourPart.commonTones voicingA voicingB

                        expected =
                            0
                    in
                    Expect.equal expected result
            , test "should return no common tones between the same chord an octave apart" <|
                \_ ->
                    let
                        voicingA =
                            Voicing.fourPart
                                Pitch.c4
                                { voiceOne = Interval.perfectUnison
                                , voiceTwo = Interval.majorThird
                                , voiceThree = Interval.perfectFifth
                                , voiceFour = Interval.majorSeventh
                                }

                        voicingB =
                            Voicing.fourPart
                                Pitch.c5
                                { voiceOne = Interval.perfectUnison
                                , voiceTwo = Interval.minorThird
                                , voiceThree = Interval.perfectFifth
                                , voiceFour = Interval.minorSeventh
                                }

                        result =
                            FourPart.commonTones voicingA voicingB

                        expected =
                            0
                    in
                    Expect.equal expected result
            ]
        ]
