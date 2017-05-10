module Components.ElevatedCard.Update exposing (..)

import Components.ElevatedCard.Model exposing (Model)
import Components.ElevatedCard.Msg exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Raise ->
            ( { model | raised = True }, Cmd.none )

        Lower ->
            ( { model | raised = False }, Cmd.none )
