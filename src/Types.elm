module Types exposing (..)

import Cats.Types
import Counter.Types
import Explorer.Types
import Router.Types
import Wallet.Types


type alias Model =
    { router : Router.Types.Model, cats : Cats.Types.Model, counter : Counter.Types.Model, wallet : Wallet.Types.Model, explorer : Explorer.Types.Model }


type Msg
    = MsgForRouter Router.Types.Msg
    | MsgForCats Cats.Types.Msg
    | MsgForCounter Counter.Types.Msg
    | MsgForWallet Wallet.Types.Msg
    | MsgForExplorer Explorer.Types.Msg
