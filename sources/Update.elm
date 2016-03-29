module Update (update) where

import Effects exposing (Effects, none)

import Actions       exposing (Action(..))
import Country       exposing (Country(..))
import Orders        exposing (Orders, orders)
import Model         exposing (Model)
import Communication exposing (getBoard, postOrders)

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    SetOrders country orders ->
      (
        case country of
          Austria ->
            { model | austria = orders }
          England ->
            { model | england = orders }
          France ->
            { model | france = orders }
          Germany ->
            { model | germany = orders }
          Italy ->
            { model | italy = orders }
          Russia ->
            { model | russia = orders }
          Turkey ->
            { model | turkey = orders },
        none
      )
    GetBoardRequest ->
      (
        model,
        getBoard model
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
        postOrders model
      )
    PostOrdersResponse (Just board) ->
      (
        {
          model |
          board = Just board,
          austria = orders,
          england = orders,
          france = orders,
          germany = orders,
          italy = orders,
          russia = orders,
          turkey = orders
        },
        none
      )
    _ ->
      (
        model,
        none
      )
