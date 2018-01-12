import Html exposing (beginnerProgram, div, button, text)
import Html.Events exposing (onClick)

--Model
main =
  beginnerProgram { model = 0, view = view, update = update }


--View
view : model -> Html.Html Msg
view model =
  div []
    [ button [ onClick Increment ] [ text "+" ]
    , div [] [ text (toString model) ]
    , button [ onClick Decrement ] [ text "-" ]
    ]


--> Update

type Msg = Increment | Decrement

update : Msg -> number -> number
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1
