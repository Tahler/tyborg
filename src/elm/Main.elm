module Main exposing (..)

import Html
import Root.Model exposing (Model, model)
import Root.Msg exposing (Msg)
import Root.Update exposing (update)
import Root.View exposing (view)


main : Program Never Model Msg
main =
    Html.program
        { init = ( model, Cmd.none )
        , update = update
        , subscriptions = always Sub.none
        , view = view
        }
