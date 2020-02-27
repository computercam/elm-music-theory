module Libs.ConstraintSolver exposing (combineConstraints, solve, tryAllFor)

import Result.Extra


solve :
    { problemSetup : problemSetup
    , getNextSetups : problemSetup -> List problemSetup
    , constraints : List (problemSetup -> Result error Bool)
    , setupToSolution : problemSetup -> Result error solution
    , cantConvertError : error
    }
    -> List solution
solve { problemSetup, getNextSetups, constraints, setupToSolution, cantConvertError } =
    { current = problemSetup
    , backtrack = []
    , solved = []
    }
        |> solveHelp constraints getNextSetups setupToSolution cantConvertError
        |> .solved


tryAllFor :
    (problemSetup -> Maybe part)
    -> List part
    -> (problemSetup -> part -> problemSetup)
    -> List problemSetup
    -> List problemSetup
tryAllFor accessor possibleValues updateValue problemSetups =
    List.concatMap
        (\problemSetup ->
            case accessor problemSetup of
                Nothing ->
                    List.map (updateValue problemSetup) possibleValues

                Just value ->
                    []
        )
        problemSetups


combineConstraints :
    List (Result error Bool)
    -> Result error Bool
combineConstraints constraints =
    List.foldl
        (\constraint state ->
            state
                |> Result.map always
                |> Result.Extra.andMap constraint
        )
        (Ok True)
        constraints


type alias InProgress problemSetup solution =
    { current : problemSetup
    , backtrack : List problemSetup
    , solved : List solution
    }


solveHelp :
    List (problemSetup -> Result error Bool)
    -> (problemSetup -> List problemSetup)
    -> (problemSetup -> Result error solution)
    -> error
    -> InProgress problemSetup solution
    -> InProgress problemSetup solution
solveHelp constraints getNextSetups setupToSolution cantConvertError { current, backtrack, solved } =
    case extractSolution setupToSolution constraints current cantConvertError of
        Ok solution ->
            case backtrack of
                [] ->
                    { current = current
                    , backtrack = backtrack
                    , solved = solved ++ [ solution ]
                    }

                head :: tail ->
                    solveHelp
                        constraints
                        getNextSetups
                        setupToSolution
                        cantConvertError
                        { current = head
                        , backtrack = tail
                        , solved = solved ++ [ solution ]
                        }

        Err error ->
            if isValidSoFar constraints current then
                case getNextSetups current of
                    [] ->
                        { current = current
                        , backtrack = backtrack
                        , solved = solved
                        }

                    head :: tail ->
                        solveHelp
                            constraints
                            getNextSetups
                            setupToSolution
                            cantConvertError
                            { current = head
                            , backtrack = backtrack ++ tail
                            , solved = solved
                            }

            else
                case backtrack of
                    [] ->
                        { current = current
                        , backtrack = backtrack
                        , solved = solved
                        }

                    head :: tail ->
                        solveHelp
                            constraints
                            getNextSetups
                            setupToSolution
                            cantConvertError
                            { current = head
                            , backtrack = tail
                            , solved = solved
                            }


extractSolution :
    (problemSetup -> Result error solution)
    -> List (problemSetup -> Result error Bool)
    -> problemSetup
    -> error
    -> Result error solution
extractSolution validateSolution constraints theProblemSetup cantConvertError =
    if isValidSoFar constraints theProblemSetup then
        validateSolution theProblemSetup

    else
        Err cantConvertError


isValidSoFar :
    List (problemSetup -> Result error Bool)
    -> problemSetup
    -> Bool
isValidSoFar constraints theProblemSetup =
    List.all
        (\constraint -> Result.Extra.isOk (constraint theProblemSetup))
        constraints
