module Root.Update exposing (..)

import Root.Msg exposing (Msg)
import Root.Model exposing (Model)
import Components.ElevatedCard.Update as ElevatedCard


update : Msg -> Model -> ( Model, Cmd )
update msg model =
    ( { model
        | elevatedCard = ElevatedCard.update msg model.elevatedCard
      }
    , Cmd.none
    )
