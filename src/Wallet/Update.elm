module Wallet.Update exposing (..)

import Wallet.Types exposing (..)
import Return exposing (Return, return)
import Types


init : Return Msg Model
init =
    return
        { sample = ""
        }
        Cmd.none


update : Types.Msg -> Model -> Return Msg Model
update msgFor model =
    case msgFor of
        Types.MsgForWallet msg ->
            updateWallet msg model

        _ ->
            return model Cmd.none


updateWallet : Msg -> Model -> Return Msg Model
updateWallet msg model =
    case msg of
        NoOp ->
            return model Cmd.none
