module Components.ElevatedCard.Update exposing (..)

import Root.Msg as Root exposing (..)
import Components.ElevatedCard.Model exposing (Model)
import Components.ElevatedCard.Msg as ElevatedCard exposing (..)


update : Root.Msg -> Model -> Model
update msg model =
    case msg of
        ElevatedCardMsg msg ->
            updateElevatedCard msg model

        _ ->
            model


updateElevatedCard : ElevatedCard.Msg -> Model -> Model
updateElevatedCard msg model =
    case msg of
        Raise ->
            { model | raised = True }

        Lower ->
            { model | raised = False }
