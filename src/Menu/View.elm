module Menu.View exposing (menuItem, menuSection, menuTitle)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import FontAwesome.Attributes exposing (sm)
import FontAwesome.Icon exposing (Icon, viewStyled)
import Types exposing (..)


menuTitle : String -> Element Msg
menuTitle title =
    el [ Font.color <| rgb255 189 147 249, Font.size 12, Font.bold, Font.letterSpacing 1.6 ] <| text <| String.toUpper title


menuItem : Icon -> String -> Bool -> Element Msg
menuItem icon menuText active =
    let
        itemAttributes =
            [ width fill, paddingXY 8 12, Border.rounded 2, spacing 10, pointer ]

        textAttributes =
            if active then
                [ Background.color <| rgb255 255 121 198, Font.color <| rgb 1 1 1 ]

            else
                [ Font.color <| rgb255 248 248 242 ]
    in
    row (List.append itemAttributes textAttributes)
        [ el [] <| html <| viewStyled [ sm ] icon
        , el [ Font.size 16 ] <| text menuText
        ]


menuSection : List (Element Msg) -> Element Msg
menuSection menus =
    column [ width fill, spacing 8 ] menus
