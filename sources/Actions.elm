module Actions (Action(..)) where

import Orders exposing (Orders)
import Board exposing (Board)

type Action =
  SetOrders Orders |
  GetBoardRequest |
  GetBoardResponse (Maybe Board) |
  PostOrdersRequest |
  PostOrdersResponse (Maybe Board)
