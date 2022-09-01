module Explorer.Data exposing (getFunds)

import Explorer.Types exposing (Fund, Funds, Msg(..))
import Http
import Json.Decode as Decode
import Json.Decode.Extra exposing (withDefault)
import RemoteData exposing (fromResult)


getFunds : Cmd Msg
getFunds =
    let
        url =
            "https://fiis-api-4x3iz.ondigitalocean.app/api/funds/explorer"

        returnMsg =
            fromResult >> FundsRetrieved
    in
    Http.get
        { url = url
        , expect = Http.expectJson returnMsg decodeFunds
        }


decodeFund : Decode.Decoder Fund
decodeFund =
    let
        map =
            Decode.map4

        field =
            Decode.field

        string =
            Decode.string

        float =
            Decode.float
    in
    map Fund
        (field "code" string)
        (field "dy" <| withDefault 0.0 float)
        (field "last_price" float)
        (field "p_vp" float)


decodeFunds : Decode.Decoder Funds
decodeFunds =
    Decode.list decodeFund
