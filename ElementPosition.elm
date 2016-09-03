port module ElementPosition exposing (..)

port suggestions : (List String -> msg) -> Sub msg
port check : String -> Cmd msg
