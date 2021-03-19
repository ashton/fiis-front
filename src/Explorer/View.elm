module Explorer.View exposing (..)

import Components exposing (showNotification)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Explorer.Helper exposing (fundIndicative, indicativeComparison)
import Explorer.Styles as Styles
import Explorer.Types exposing (..)
import FormatNumber exposing (format)
import FormatNumber.Locales exposing (Decimals(..), spanishLocale)
import Http exposing (Error(..))
import RemoteData exposing (RemoteData(..))


locale : FormatNumber.Locales.Locale
locale =
    { spanishLocale | decimals = Exact 2 }


view : Model -> Element Msg
view model =
    case model of
        Success funds ->
            wrappedRow [ width fill, spacing 24, padding 12 ] <| renderCards funds

        Failure error ->
            showError error

        _ ->
            el [] <| text "Not Loaded"


renderCards : Funds -> List (Element Msg)
renderCards funds =
    funds
        -- DESC order
        |> List.sortWith (\a b -> indicativeComparison (fundIndicative b) (fundIndicative a))
        |> List.map card


cardColor : Fund -> List (Attribute Msg)
cardColor fund =
    case fundIndicative fund of
        Bad ->
            [ Background.color <| rgb255 255 85 85, Font.color <| rgb 0 0 0 ]

        Medium ->
            [ Background.color <| rgb255 241 250 140, Font.color <| rgb 0 0 0 ]

        Good ->
            [ Background.color <| rgb255 108 214 126, Font.color <| rgb 1 1 1 ]


card : Fund -> Element Msg
card fund =
    column (List.append Styles.card (cardColor fund))
        [ column []
            [ el Styles.cardInfoTitle <| text "Papel"
            , el Styles.cardTitle <| text fund.code
            ]
        , row Styles.cardInfo
            [ column Styles.cardInfoItem
                [ el Styles.cardInfoTitle <| text "Preço"
                , el Styles.cardInfoValue <| text <| "R$ " ++ format locale fund.lastPrice
                ]
            , column Styles.cardInfoItem
                [ el Styles.cardInfoTitle <| text "DY"
                , el Styles.cardInfoValue <| text <| format locale fund.dy ++ "%"
                ]
            , column Styles.cardInfoItem
                [ el Styles.cardInfoTitle <| text "VP / Cota"
                , el Styles.cardInfoValue <| text <| "R$ " ++ format locale fund.pricePerQuota
                ]
            ]
        ]


showError : Error -> Element Msg
showError error =
    case error of
        BadBody message ->
            showNotification Components.Error message

        BadUrl message ->
            showNotification Components.Error message

        BadStatus status ->
            showNotification Components.Error <| "Error loading funds: status " ++ String.fromInt status

        _ ->
            showNotification Components.Error "Error loading funds, please try again"
