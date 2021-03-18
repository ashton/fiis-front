module Explorer.View exposing (..)

import Element exposing (..)
import Explorer.Styles as Styles
import Explorer.Types exposing (..)


view : Model -> Element Msg
view model =
    wrappedRow [ width fill, spacing 24, padding 12 ]
        [ card model
        , card model
        , card model
        , card model
        ]


card : Model -> Element Msg
card model =
    column Styles.card
        [ column []
            [ el Styles.cardInfoTitle <| text "Papel"
            , el Styles.cardTitle <| text "FIIP11B"
            ]
        , row Styles.cardInfo
            [ column Styles.cardInfoItem
                [ el Styles.cardInfoTitle <| text "Preço"
                , el Styles.cardInfoValue <| text "R$ 199,89"
                ]
            , column Styles.cardInfoItem
                [ el Styles.cardInfoTitle <| text "DY"
                , el Styles.cardInfoValue <| text "10,37%"
                ]
            , column Styles.cardInfoItem
                [ el Styles.cardInfoTitle <| text "P/VP"
                , el Styles.cardInfoValue <| text "R$ 193,16"
                ]
            ]
        ]
