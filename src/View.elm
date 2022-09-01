module View exposing (renderRoute, view)

import Browser
import Cats.View
import Counter.View
import Element exposing (..)
import Element.Region exposing (heading)
import Explorer.View
import FontAwesome.Solid as Icon
import FontAwesome.Styles
import Menu.View exposing (menuItem, menuSection, menuTitle)
import Projections.View
import Router.Routes exposing (..)
import Router.Types exposing (Msg(..))
import Styles
import Types exposing (..)
import Wallet.View


view : Model -> Browser.Document Types.Msg
view model =
    { title = "Fiis"
    , body =
        [ Element.layout Styles.layout <|
            column Styles.container
                [ html FontAwesome.Styles.css
                , header
                , page model
                ]
        ]
    }


renderRoute : Model -> Element Types.Msg
renderRoute model =
    case model.router.page of
        Home ->
            column [ spacing 5 ]
                [ el [ heading 1 ] (text "Welcome")
                , row [ spacing 5 ]
                    [ link [ padding 5 ] { url = toPath CatsPage, label = text "Go to Cats" }
                    , link [ padding 5 ] { url = toPath CounterPage, label = text "Go to Counter" }
                    ]
                ]

        NotFound ->
            text "404 Not Found"

        CatsPage ->
            Element.map MsgForCats (Cats.View.view model.cats)

        CounterPage ->
            Element.map MsgForCounter (Counter.View.view model.counter)

        WalletPage ->
            Element.map MsgForWallet (Wallet.View.view model.wallet)

        ExplorerPage ->
            Element.map MsgForExplorer (Explorer.View.view model.explorer)

        ProjectionsPage ->
            Element.map MsgForProjections (Projections.View.view model.projections)


sidebar : Element Types.Msg
sidebar =
    column Styles.sidebar
        [ menuTitle "general"
        , menuSection [ menuItem Icon.tachometerAlt "Dashboard" True ]
        , menuTitle "projections"
        , menuSection [ menuItem Icon.chartLine "Dashboard" False ]
        , menuTitle "administration"
        , menuSection
            [ menuItem Icon.edit "Forms" False
            , menuItem Icon.desktop "UI Elements" False
            , menuItem Icon.table "Tables" False
            , menuItem Icon.chartBar "Presentations" False
            , menuItem Icon.cog "Layouts" False
            ]
        ]


header : Element Types.Msg
header =
    row Styles.header
        [ image [ width <| px 45, height <| px 45 ] { src = "building.png", description = "logo" } ]


page : Model -> Element Types.Msg
page model =
    row Styles.page [ sidebar, renderRoute model ]
