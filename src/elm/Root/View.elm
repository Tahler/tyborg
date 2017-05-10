module Root.View exposing (..)

import Html exposing (Html, div, text)
import Material
import Material.Card as Card
import Material.Color as Color
import Material.Layout as Layout
import Material.Options as Options exposing (css)
import Material.Scheme as Scheme
import Material.Typography as Typography
import Root.Model exposing (Model)
import Root.Msg exposing (Msg)
import Components.ElevatedCard.View as ElevatedCard


-- type alias Mdl =
--     Material.Model
-- view : Model -> Html Msg
-- view model =
--     Scheme.top <|
--         Layout.render Mdl
--             model.mdl
--             []
--             { header = []
--             , drawer = []
--             , tabs = ( [], [] )
--             , main = [ viewBody model ]
--             }


view : Model -> Html Msg
view model =
    div []
        [ ElevatedCard.view
            model.elevatedCard
            [ css "width" "256px"
            , css "height" "256px"
            , css "background" "url('https://raw.githubusercontent.com/debois/elm-mdl/v8/demo/assets/images/elm.png') center / cover"
            ]
            [ Card.text [ Card.expand, Card.border ] [] -- Filler
            , Card.text
                [ css "background" "rgba(0, 0, 0, 0.5)" ]
                -- Non-gradient scrim
                [ Options.span
                    [ Color.text Color.white, Typography.title, Typography.contrast 1.0 ]
                    [ text "Elm programming" ]
                ]
            ]
        , ElevatedCard.view
            model.elevatedCard
            [ css "width" "256px"
            , css "height" "256px"
            , css "background" "url('https://raw.githubusercontent.com/debois/elm-mdl/v8/demo/assets/images/elm.png') center / cover"
            ]
            [ Card.text [ Card.expand, Card.border ] [] -- Filler
            , Card.text
                [ css "background" "rgba(0, 0, 0, 0.5)" ]
                -- Non-gradient scrim
                [ Options.span
                    [ Color.text Color.white, Typography.title, Typography.contrast 1.0 ]
                    [ text "Elm programming" ]
                ]
            ]
        ]
