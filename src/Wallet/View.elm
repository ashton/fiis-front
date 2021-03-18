module Wallet.View exposing (..)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import FontAwesome.Attributes exposing (sm)
import FontAwesome.Icon exposing (..)
import FontAwesome.Solid as Icon
import Wallet.Types exposing (..)


view : Model -> Element Msg
view model =
    Element.none
