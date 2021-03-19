module Explorer.Update exposing (..)

import Explorer.Data exposing (getFunds)
import Explorer.Types exposing (..)
import RemoteData exposing (RemoteData(..))
import Return exposing (Return, return)
import Types


init : Return Msg Model
init =
    return
        NotAsked
        getFunds


update : Types.Msg -> Model -> Return Msg Model
update msgFor model =
    case msgFor of
        Types.MsgForExplorer msg ->
            updateExplorer msg model

        _ ->
            return model Cmd.none


updateExplorer : Msg -> Model -> Return Msg Model
updateExplorer msg model =
    case msg of
        FundsRetrieved funds ->
            return funds Cmd.none
