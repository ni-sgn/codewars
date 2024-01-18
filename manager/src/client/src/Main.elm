module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text, p)
import Html.Events exposing (onClick)
import Http

main : Program () Model Msg
main =
  Browser.element {
    init = \flags -> ( "Click to recieve your name", Cmd.none )
    , view = view
    , update = update
    , subscriptions = \_ -> Sub.none
    }

type alias Model = String
type Msg = SendHttpRequest | DataRecieved (Result Http.Error String)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    DataRecieved result->
      case result of
        Ok str -> (str, Cmd.none) 
        Err sm -> ("Some error happened", Cmd.none)
    SendHttpRequest ->
      (model, getUser)

view : Model -> Html Msg
view model =
  div []
    [
      button [onClick SendHttpRequest] [text "Click to Recieve data"] 
      ,p [] [ text model ]  
    ]

url : String
url = "http://localhost:80/get-user"

getUser : Cmd Msg
getUser = 
  Http.get {
    url = url
    , expect = Http.expectString DataRecieved
    }
