module Explorer.Styles exposing (card, cardInfo, cardInfoItem, cardInfoTitle, cardInfoValue, cardTitle)

import Element exposing (..)
import Element.Border as Border
import Element.Font as Font


card : List (Attribute msg)
card =
    [ paddingEach { top = 20, right = 30, bottom = 20, left = 24 }
    , spacing 24
    , Border.rounded 6
    ]


cardTitle : List (Attribute msg)
cardTitle =
    [ Font.size 32
    , Font.semiBold
    , spacing 1
    ]


cardInfo : List (Attribute msg)
cardInfo =
    [ spacing 15
    ]


cardInfoItem : List (Attribute msg)
cardInfoItem =
    [ spacing 5
    ]


cardInfoTitle : List (Attribute msg)
cardInfoTitle =
    [ Font.size 11
    , width fill
    ]


cardInfoValue : List (Attribute msg)
cardInfoValue =
    [ Font.size 20
    , Font.semiBold
    ]
