module App exposing (..)

import Html exposing (Html, div, text)
import Material
import Material.Card as Card


-- MODEL


type alias Model =
    { title : String
    , desc : String
    , img : String
    , mdl : Material.Model
    }



-- MESSAGES


type Msg
    = Hover



-- VIEW


view : Model -> Html Msg
view model =
    Card.view
        []
        [ Card.title
            [ css "background" "url('assets/pomegranate.jpg') center / cover"
            , css "height" "256px"
            , css "padding" "0" -- Clear default padding to encompass scrim
            ]
            [ Card.head
                [ white
                , Options.scrim 0.75
                , css "padding" "16px" -- Restore default padding inside scrim
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



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )
