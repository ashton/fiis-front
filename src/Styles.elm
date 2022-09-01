module Styles exposing (..)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


layout : List (Attr () msg)
layout =
    [ Background.color <| rgb255 40 42 54
    , Font.family
        [ Font.typeface "BlinkMacSystemFont"
        , Font.typeface "-apple-system"
        , Font.typeface "Segoe UI"
        , Font.typeface "Roboto"
        , Font.typeface "Oxygen"
        , Font.typeface "Ubuntu"
        , Font.typeface "Cantarell"
        , Font.typeface "Fira Sans"
        , Font.typeface "Droid Sans"
        , Font.typeface "Helvetica Neue"
        , Font.typeface "Helvetica"
        , Font.typeface "Arial"
        , Font.sansSerif
        ]
    , Font.color <| rgb255 248 248 242
    ]


sidebar : List (Attribute msg)
sidebar =
    [ height fill
    , width <| px 250
    , Background.color <| rgb255 68 71 90
    , paddingEach { top = 32, left = 8, right = 8, bottom = 0 }
    , spacing 12
    ]


header : List (Attribute msg)
header =
    [ width fill, paddingXY 12 8, Background.color <| rgb255 68 71 90 ]


page : List (Attribute msg)
page =
    [ width fill, height fill ]


pageHeaderIcon : List (Attribute msg)
pageHeaderIcon =
    [ width <| px 48
    , height <| px 48
    , alignLeft
    , Background.color <| rgb255 189 147 249
    , Border.rounded 3
    , Font.color <| rgb255 40 42 54
    ]


container : List (Attribute msg)
container =
    [ width fill, height fill, spacing 2 ]


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
