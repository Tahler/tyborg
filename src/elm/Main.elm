module Main exposing (..)

import Html exposing (Html, div, text)
import Material
import Material.Button as Button
import Material.Card as Card
import Material.Color as Color
import Material.Elevation as Elevation
import Material.Layout as Layout
import Material.Options as Options exposing (css)
import Material.Scheme
import Components.Header exposing (header)


-- MODEL


type alias Model =
    { mdl : Material.Model
    }


model : Model
model =
    { mdl = Material.model
    }



-- ACTION, UPDATE


type Msg
    = Mdl (Material.Msg Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Mdl msg_ ->
            Material.update Mdl msg_ model



-- VIEW


type alias Mdl =
    Material.Model


view : Model -> Html Msg
view model =
    Material.Scheme.top <|
        Layout.render Mdl
            model.mdl
            []
            { header = [ header ]
            , drawer = []
            , tabs = ( [], [] )
            , main = [ viewBody model ]
            }


viewBody : Model -> Html Msg
viewBody model =
    Card.view
        [ Elevation.e2
        , css "width" "256px"
        ,  css "margin" "50px"
        ]
        [ Card.title
            [ css "background" "url('https://raw.githubusercontent.com/debois/elm-mdl/v8/demo/assets/images/pomegranate.jpg') center / cover"
            , css "height" "256px"
            , css "padding" "0"

            -- Clear default padding to encompass scrim
            ]
            [ Card.head
                [ Color.text Color.white
                , Options.scrim 0.75
                , css "padding" "16px"
                , css "width" "100%"
                ]
                [ text "Grenadine" ]
            ]
        , Card.text []
            [ text "Non-alcoholic syrup used for both its tart and sweet flavour as well as its deep red color." ]
        , Card.actions
            [ Card.border ]
            [ Button.render Mdl
                [ 1, 0 ]
                model.mdl
                [ Button.ripple, Button.accent ]
                [ text "Ingredients" ]
            , Button.render Mdl
                [ 1, 1 ]
                model.mdl
                [ Button.ripple, Button.accent ]
                [ text "Cocktails" ]
            ]
        ]


main : Program Never Model Msg
main =
    Html.program
        { init = ( model, Cmd.none )
        , view = view
        , subscriptions = always Sub.none
        , update = update
        }
