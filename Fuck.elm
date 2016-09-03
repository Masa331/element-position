port module Fuck exposing (..)

port fuck : String -> Cmd msg

-- port suggestions : (List String -> msg) -> Sub msg
port suggestions : (List String -> msg) -> Sub msg

port check : String -> Cmd msg
