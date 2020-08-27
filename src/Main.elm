module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)



-- Main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- Model


type alias Todo =
    { id : String
    , content : String
    }


type alias Model =
    { newTodo : Todo
    , todoList : List Todo
    }


init : Model
init =
    { newTodo =
        { id = ""
        , content = ""
        }
    , todoList = []
    }



-- Update


type Msg
    = Add
    | Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Add ->
            { model
                | todoList = { id = "1", content = model.newTodo.content } :: model.todoList
                , newTodo = { id = "1", content = "" }
            }

        Change str ->
            { model | newTodo = { id = "1", content = str } }



-- View


view : Model -> Html Msg
view model =
    div []
        [ input
            [ type_ "text"
            , placeholder "Input your todo"
            , onInput Change
            , value model.newTodo.content
            ]
            []
        , button [ onClick Add ] [ text "Add" ]
        , div [] (List.map showList model.todoList)
        ]


showList : Todo -> Html Msg
showList todo =
    div []
        [ text todo.id
        , text todo.content
        ]
