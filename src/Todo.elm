module Todo exposing (..)

import Html exposing (..)



-- Model


type alias Model =
    String


init : String -> Model
init task =
    task



-- Update
-- View


view : Model -> Html Msg
view model =
    div [] [ text model ]
