module Main exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String

import ElementPosition exposing (suggestions, check)

-- port suggestions : (List String -> msg) -> Sub msg
-- port check : String -> Cmd msg

main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

type alias Model =
  { word : String
  , suggestions : List String
  }

init : (Model, Cmd Msg)
init =
  (Model "" [], Cmd.none)

type Msg
  = Change String
  | Check
  | Suggest (List String)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Change newWord ->
      (Model newWord [], Cmd.none)

    Check ->
      (model, check model.word)

    Suggest newSuggestions ->
      (Model model.word newSuggestions, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
  suggestions Suggest

view : Model -> Html Msg
view model =
  div []
    [ input [onInput Change] []
    , button [ onClick Check ] [ text "Check" ]
    , div [] [  text (String.join ", " model.suggestions) ]
  ]
