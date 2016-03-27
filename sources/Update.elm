module Update (update) where

import Effects exposing (Effects, none)

import Actions       exposing (Action(..))
import Orders        exposing (orders)
import Model         exposing (Model)
import Communication exposing (getBoard, postOrders)

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    SetOrders orders ->
      (
        {
          model |
          orders = orders
        },
        none
      )
    GetBoardRequest ->
      (
        model,
        getBoard model.server model.gameId
      )
    GetBoardResponse (Just board) ->
      (
        {
          model |
          board = Just board
        },
        none
      )
    PostOrdersRequest ->
      (
        model,
        postOrders model.server model.gameId model.orders
      )
    PostOrdersResponse (Just board) ->
      (
        {
          model |
          board = Just board,
          orders = orders
        },
        none
      )
    _ ->
      (
        model,
        none
      )
