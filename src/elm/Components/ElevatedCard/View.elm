module Components.ElevatedCard.View exposing (view)

import Html exposing (Html)
import List
import Root.Msg as Root exposing (..)
import Components.ElevatedCard.Msg exposing (..)
import Components.ElevatedCard.Model exposing (Model)
import Material.Card as Card exposing (Block)
import Material.Elevation as Elevation
import Material.Options as Options exposing (Style, css)


elevationOptions : Model -> List (Style Root.Msg)
elevationOptions model =
    [ if model.raised then
        Elevation.e8
      else
        Elevation.e2
    , Elevation.transition 250
    , Options.onMouseEnter (ElevatedCardMsg Raise)
    , Options.onMouseLeave (ElevatedCardMsg Lower)
    ]


view : Model -> List (Style Root.Msg) -> List (Block Root.Msg) -> Html Root.Msg
view model styling views =
    Card.view (List.append (elevationOptions model) styling) views
