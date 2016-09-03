module Main exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String

import Fuck exposing (..)

main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

subscriptions model =
  Sub.none


type alias Model =
  { word : String
  , suggestions : List String
  }

init : (Model, Cmd Msg)
init =
  (Model "neco" [], (fuck "hovno"))

type Msg
  = Change String
  | Check
  | Suggest (List String)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  (model, Cmd.none)

view : Model -> Html Msg
view model =
  div [] [ text (toString model) ]
