import Html exposing (beginnerProgram, div, button, text, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

main = 
  beginnerProgram {model = model, update = update, view = view}

--model
type alias Model = 
  {todo: String
  ,todos: List String
  }

model : Model
model = 
  {todo = "", todos = []}

--view
todoItem: String -> Html.Html Msg
todoItem todo = 
  Html.li [][text todo, button[onClick (RemoveItem todo) ][text "X"]] --returns a li for a todo

todoList: List String -> Html.Html Msg
todoList todos =
  let 
    child =
      List.map todoItem todos --Returns a list of all todos as li's
  in
    Html.ul [] child --fills unordered list with mapped li todos


view model = 
  div [] 
  [
    input [ type_ "text"
            , onInput UpdateTodo
            , value model.todo
            ] 
            []
    ,button [ onClick AddTodo ] [ text "Submit" ]
    ,button [ onClick RemoveAll ] [ text "Remove All" ]
    ,div [] [todoList model.todos]
  ]

--update
type Msg =
  UpdateTodo String
  | AddTodo
  | RemoveAll
  | RemoveItem String

update: Msg -> Model -> Model
update msg model =
  case msg of
    UpdateTodo text -> 
      {model | todo = text}
    AddTodo ->
      {model | todos = model.todo :: model.todos, todo = ""}
    RemoveAll -> 
      {model | todos = []}
    RemoveItem text ->
      {model | todos = List.filter (\x -> x /= text) model.todos }