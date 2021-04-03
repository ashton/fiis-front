module Styles exposing (container, header, layout, page, pageHeaderIcon, sidebar)

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
