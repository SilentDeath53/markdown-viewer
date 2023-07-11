module Main exposing (..)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Markdown exposing (toHtml)
import String

type alias Model =
    { markdown : String
    }

type Msg
    = UpdateMarkdown String

init : Model
init =
    { markdown = "# Hello, Markdown!\n\nThis is **bold** and this is *italic*." }

update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateMarkdown newMarkdown ->
            { model | markdown = newMarkdown }

view : Model -> Html Msg
view model =
    div []
        [ div [ class "markdown" ] [ toHtml model.markdown ]
        , div []
            [ text "Edit Markdown: "
            , textarea [ onInput UpdateMarkdown ] [ text model.markdown ]
            ]
        ]

main =
    Browser.sandbox { init = init, update = update, view = view }
