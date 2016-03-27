module Communication (getBoard, postOrders) where

import Effects exposing (Effects, task)
import Http    exposing (Body, get, post, string)
import Task    exposing (toMaybe, map)

import Orders  exposing (Orders)
import Server  exposing (Server)
import GameId  exposing (GameId)
import Board   exposing (board)
import Actions exposing (Action(..))

url : Server -> GameId -> String -> String
url server gameId action =
  server ++ "/" ++ toString gameId ++ "/" ++ action

getBoard : Server -> GameId -> Effects Action
getBoard server gameId =
  get board (url server gameId "board")
    |> toMaybe
    |> map GetBoardResponse
    |> task

body : Orders -> Body
body = string

postOrders : Server -> GameId -> Orders -> Effects Action
postOrders server gameId orders =
  post board (url server gameId "orders") (body orders)
    |> toMaybe
    |> map PostOrdersResponse
    |> task
