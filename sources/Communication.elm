module Communication (getTime, getProvinces, postOrders) where

import Effects                       exposing (Effects, task)
import Http                          exposing (Body, get, post)
import Task                          exposing (toMaybe, map)
import Json.Encode      as Encode    exposing (encode, object)

import Model                         exposing (Model)
import Models.Time      as Time      exposing (Time, time)
import Models.Provinces as Provinces exposing (provinces)
import Actions                       exposing (Action(..))

url : Model -> String -> String
url model action =
  model.server ++ "/" ++ toString model.game ++ "/" ++ action

getTime : Model -> Effects Action
getTime model =
  get time (url model "time")
    |> toMaybe
    |> map GetTimeResponse
    |> task

getProvinces : Model -> Effects Action
getProvinces model =
  get provinces (url model "provinces")
    |> toMaybe
    |> map GetProvincesResponse
    |> task

body : Model -> Body
body model =
  Http.string <|
    encode 0 <|
      object
        [
          ("a", Encode.string model.austria),
          ("e", Encode.string model.england),
          ("f", Encode.string model.france),
          ("g", Encode.string model.germany),
          ("i", Encode.string model.italy),
          ("r", Encode.string model.russia),
          ("t", Encode.string model.turkey)
        ]

postOrders : Model -> Effects Action
postOrders model =
  post time (url model "orders") (body model)
    |> toMaybe
    |> map PostOrdersResponse
    |> task
