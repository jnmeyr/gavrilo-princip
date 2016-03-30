module Model (Model, model) where

import Models.Orders    as Order     exposing (Orders, orders)
import Models.Server    as Server    exposing (Server)
import Models.Game      as Game      exposing (Game)
import Models.Time      as Time      exposing (Time)
import Models.Provinces as Provinces exposing (Provinces)

type alias Model =
  {
    server : Server,
    game : Game,
    time : Maybe Time,
    provinces : Maybe Provinces,
    austria : Orders,
    england : Orders,
    france : Orders,
    germany : Orders,
    italy : Orders,
    russia : Orders,
    turkey : Orders
  }

model : Server -> Game -> Model
model server game =
  {
    server = server,
    game = game,
    time = Nothing,
    provinces = Nothing,
    austria = orders,
    england = orders,
    france = orders,
    germany = orders,
    italy = orders,
    russia = orders,
    turkey = orders
  }
