module Util.Fuzzer exposing (fromList)

import Fuzz exposing (Fuzzer)
import List.Extra
import MusicTheory.Octave as Octave exposing (Octave)


fromList : List a -> Fuzzer a
fromList xs =
    Fuzz.intRange 0 ((xs |> List.length) - 1)
        |> Fuzz.map
            (\n ->
                case xs |> List.Extra.getAt n of
                    Just x ->
                        x

                    Nothing ->
                        Debug.todo "impossible"
            )
