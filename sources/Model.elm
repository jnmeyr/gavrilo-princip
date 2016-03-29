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
    austria : Orders,
    england : Orders,
    france : Orders,
    germany : Orders,
    italy : Orders,
    russia : Orders,
    turkey : Orders
  }

model : Server -> GameId -> Model
model server gameId =
  {
    server = server,
    gameId = gameId,
    board = Nothing,
    austria = orders,
    england = orders,
    france = orders,
    germany = orders,
    italy = orders,
    russia = orders,
    turkey = orders
  }
