module Global exposing
    ( Flags
    , Model
    , Msg(..)
    , init
    , navigate
    , send
    , subscriptions
    , update
    , view
    )

import Browser.Navigation as Nav
import Document exposing (Document)
import Generated.Route as Route exposing (Route)
import MusicTheory.Note
import MusicTheory.Pitch
import Ports
import Task
import UI
import Url exposing (Url)



-- INIT


type alias Flags =
    ()


type alias Model =
    { flags : Flags
    , url : Url
    , key : Nav.Key
    , notes : List MusicTheory.Note.Note
    }


init : Flags -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( { flags = flags
      , url = url
      , key = key
      , notes =
            [ MusicTheory.Note.quarter MusicTheory.Pitch.a3
            , MusicTheory.Note.quarter MusicTheory.Pitch.g4
            , MusicTheory.Note.quarter MusicTheory.Pitch.c5
            , MusicTheory.Note.quarter MusicTheory.Pitch.d5
            , MusicTheory.Note.quarter MusicTheory.Pitch.fSharp5
            ]
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = Navigate Route
    | PlayInBrowser


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Navigate route ->
            ( model
            , Nav.pushUrl model.key (Route.toHref route)
            )

        PlayInBrowser ->
            ( model
            , Ports.playInBrowser model.notes
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view :
    { page : Document msg
    , global : Model
    , toMsg : Msg -> msg
    }
    -> Document msg
view { page, global, toMsg } =
    UI.layout
        { page = page
        }



-- COMMANDS


send : msg -> Cmd msg
send =
    Task.succeed >> Task.perform identity


navigate : Route -> Cmd Msg
navigate route =
    send (Navigate route)
