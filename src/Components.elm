module Components exposing (NotificationType(..), showNotification)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


type NotificationType
    = Success
    | Error
    | Info


showNotification : NotificationType -> String -> Element msg
showNotification notificationType message =
    let
        notificationColors =
            case notificationType of
                Success ->
                    [ Background.color <| rgb255 80 250 123, Font.color <| rgb 0 0 0 ]

                Error ->
                    [ Background.color <| rgb255 255 85 85, Font.color <| rgb 1 1 1 ]

                Info ->
                    [ Background.color <| rgb255 139 233 253, Font.color <| rgb 0 0 0 ]
    in
    paragraph
        (List.append
            notificationColors
            [ width fill
            , Border.rounded 4
            , paddingEach { top = 20, right = 40, bottom = 20, left = 24 }
            ]
        )
        [ text message
        ]
