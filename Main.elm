module Main exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String

import ElementPosition exposing (..)

main =
  App.program
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }


-- MODEL

type alias Model =
  { id : String
  , position : Maybe Position
}

-- blankModel = 

init : (Model, Cmd Msg)
init =
  -- (Model "" { x = 1, y = 2 }, Cmd.none)
  (Model "" Nothing, Cmd.none)


-- UPDATE

type Msg
  = Change String
  | Check
  | PositionDetermined (Maybe Position)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Change newId ->
      ( Model newId model.position, Cmd.none )

    Check ->
      ( model, getPosition model.id )

    PositionDetermined newPosition ->
      ( Model model.id (newPosition), Cmd.none )


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  determinedPositions PositionDetermined


-- VIEW

view : Model -> Html Msg
view model =
  div []
  [ input [ onInput Change ] []
  , button [ onClick Check ] [ text "Check" ]
           , div [] [ text (toString model.position) ]
           ]
