module Explorer.Types exposing (Fund, Funds, Indicative(..), Model, Msg(..))

import RemoteData exposing (WebData)


type alias Model =
    WebData Funds


type alias Funds =
    List Fund


type alias Fund =
    { code : String
    , name : String
    , dy : Float
    , lastPrice : Float
    , pricePerQuota : Float
    }


type Indicative
    = Good
    | Medium
    | Bad


type Msg
    = FundsRetrieved (WebData Funds)
