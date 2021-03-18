module Router.Routes exposing (..)

import Browser.Navigation
import Url.Parser exposing ((</>), Parser, map, oneOf, parse, s, top)


type Page
    = Home
    | NotFound
    | CatsPage
    | CounterPage
    | WalletPage
    | ExplorerPage


routes : Parser (Page -> a) a
routes =
    oneOf
        [ map Home top
        , map NotFound (s "404")
        , map CatsPage (s "cats")
        , map CounterPage (s "counter")
        , map WalletPage (s "wallet")
        , map ExplorerPage (s "explorer")
        ]


toPath : Page -> String
toPath page =
    case page of
        Home ->
            "/"

        NotFound ->
            "/404"

        CatsPage ->
            "/cats"

        CounterPage ->
            "/counter"

        WalletPage ->
            "/wallet"

        ExplorerPage ->
            "/explorer"
