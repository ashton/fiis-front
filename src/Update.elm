module Update exposing (andMapCmd, init, update)

import Browser
import Browser.Navigation exposing (Key)
import Cats.Update
import Counter.Update
import Explorer.Update
import Projections.Update
import Return exposing (Return, andMap, mapCmd, singleton)
import Router.Update
import Types exposing (..)
import Url exposing (Url)
import Wallet.Update


init : flags -> (Url -> (Key -> Return Msg Model))
init _ url key =
    singleton Model |> andMapCmd MsgForRouter (Router.Update.init url key) |> andMapCmd MsgForCats Cats.Update.init |> andMapCmd MsgForCounter Counter.Update.init |> andMapCmd MsgForWallet Wallet.Update.init |> andMapCmd MsgForExplorer Explorer.Update.init |> andMapCmd MsgForProjections Projections.Update.init


update : Msg -> (Model -> Return Msg Model)
update msg model =
    singleton Model |> andMapCmd MsgForRouter (Router.Update.update msg model.router) |> andMapCmd MsgForCats (Cats.Update.update msg model.cats) |> andMapCmd MsgForCounter (Counter.Update.update msg model.counter) |> andMapCmd MsgForWallet (Wallet.Update.update msg model.wallet) |> andMapCmd MsgForExplorer (Explorer.Update.update msg model.explorer) |> andMapCmd MsgForProjections (Projections.Update.update msg model.projections)


andMapCmd : (msg1 -> msg2) -> (Return msg1 model1 -> (Return msg2 (model1 -> model2) -> Return msg2 model2))
andMapCmd msg =
    andMap << mapCmd msg
