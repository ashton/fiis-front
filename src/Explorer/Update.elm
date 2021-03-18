module Explorer.Update exposing (..)

import Explorer.Types exposing (..)
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
        Types.MsgForExplorer msg ->
            updateExplorer msg model

        _ ->
            return model Cmd.none


updateExplorer : Msg -> Model -> Return Msg Model
updateExplorer msg model =
    case msg of
        NoOp ->
            return model Cmd.none
