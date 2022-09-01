module Explorer.Types exposing (Fund, Funds, Indicative(..), Model, Msg(..))

import RemoteData exposing (WebData)


type alias Model =
    { funds : WebData Funds
    , filter : Maybe String
    }


type alias Funds =
    List Fund


type alias Fund =
    { code : String
    , dy : Float
    , lastPrice : Float
    , priceIndicator : Float
    }


type Indicative
    = Good
    | Medium
    | Bad


type Msg
    = FundsRetrieved (WebData Funds)
    | Filter String
