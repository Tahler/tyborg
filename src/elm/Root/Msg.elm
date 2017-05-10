module Root.Msg exposing (..)

import Components.ElevatedCard.Msg as ElevatedCard


type Msg
    = NoOp
    | ElevatedCardMsg ElevatedCard.Msg
