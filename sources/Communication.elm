module Communication (getBoard, postOrders) where

import Effects               exposing (Effects, task)
import Http                  exposing (Body, get, post)
import Task                  exposing (toMaybe, map)
import Json.Encode as Encode exposing (encode, object)

import Model                 exposing (Model)
import Board                 exposing (board)
import Actions               exposing (Action(..))

url : Model -> String -> String
url model action =
  model.server ++ "/" ++ toString model.gameId ++ "/" ++ action

getBoard : Model -> Effects Action
getBoard model =
  get board (url model "board")
    |> toMaybe
    |> map GetBoardResponse
    |> task

body : Model -> Body
body model =
  Http.string <|
    encode 0 <|
      object
        [
          ("austria", Encode.string model.austria),
          ("england", Encode.string model.england),
          ("france", Encode.string model.france),
          ("germany", Encode.string model.germany),
          ("italy", Encode.string model.italy),
          ("russia", Encode.string model.russia),
          ("turkey", Encode.string model.turkey)
        ]

postOrders : Model -> Effects Action
postOrders model =
  post board (url model "orders") (body model)
    |> toMaybe
    |> map PostOrdersResponse
    |> task
