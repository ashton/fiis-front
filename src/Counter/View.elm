module Counter.View exposing (view)

import Counter.Types exposing (..)
import Element exposing (..)
import Element.Events exposing (..)
import Element.Input exposing (button)
import RemoteData exposing (..)


view : Model -> Element Msg
view model =
    row [ centerY, spacing 5 ]
        [ button [ padding 5 ] { onPress = Just Decrement, label = text "-" }
        , text (String.fromInt model)
        , button [ padding 5 ] { onPress = Just Increment, label = text "+" }
        ]
