module Components.Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style)

header : Html a
header =
    h3 [ style [ ( "padding-left", "2rem" ) ] ] [ text "Tyler Berry" ]
