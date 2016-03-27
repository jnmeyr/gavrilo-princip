module Model (Model, model) where

import Orders exposing (Orders, orders)
import Server exposing (Server)
import GameId exposing (GameId)
import Board  exposing (Board)

type alias Model =
  {
    server : Server,
    gameId : Int,
    board : Maybe Board,
    orders : Orders
  }

model : Server -> GameId -> Model
model server gameId =
  {
    server = server,
    gameId = gameId,
    board = Nothing,
    orders = orders
  }
