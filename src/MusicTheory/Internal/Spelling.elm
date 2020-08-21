module MusicTheory.Internal.Spelling exposing (simplify)

import MusicTheory.Internal.Pitch as Pitch
import MusicTheory.Internal.Scale as Scale


simplify :
    { maxAccidentals : Int, scale : Maybe Scale.Scale }
    -> Pitch.Pitch
    -> Pitch.Pitch
simplify { maxAccidentals, scale } pitchToSimplify =
    -- TODO
    pitchToSimplify


enharmonicEquivalents : { maxAccidentals : Int } -> Pitch.Pitch -> List Pitch.Pitch
enharmonicEquivalents { maxAccidentals } pitch =
    -- TODO
    [ pitch ]
