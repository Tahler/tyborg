module Root.Model exposing (..)

import Components.ElevatedCard.Model as ElevatedCard


type alias Model =
    { elevatedCard : ElevatedCard.Model
    }


model : Model
model =
    { elevatedCard = ElevatedCard.model
    }
