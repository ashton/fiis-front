module Cats.View exposing (view)

import Cats.Types exposing (..)
import Element exposing (..)
import Element.Events exposing (..)
import Element.Input exposing (button)
import Element.Region exposing (..)
import RemoteData exposing (..)


view : Model -> Element Msg
view model =
    column [ spacing 5 ]
        [ el [ heading 2 ] (text model.topic)
        , button [ padding 5 ] { onPress = Just MorePlease, label = text "More Please!" }
        , case model.gifUrl of
            NotAsked ->
                text ""

            Loading ->
                text "Loading..."

            Success gifUrl ->
                image [] { src = gifUrl, description = "a random " ++ model.topic ++ " gif" }

            Failure _ ->
                text "Error loading gif"
        ]
