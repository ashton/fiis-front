module Explorer.Update exposing (..)

import Explorer.Data exposing (getFunds)
import Explorer.Types exposing (..)
import RemoteData exposing (RemoteData(..))
import Return exposing (Return, return)
import String.Extra exposing (nonEmpty)
import Types


init : Return Msg Model
init =
    return
        { funds = NotAsked, filter = Nothing }
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
            return { model | funds = funds } Cmd.none

        Filter term ->
            return { model | filter = nonEmpty term } Cmd.none
