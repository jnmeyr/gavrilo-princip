module Actions (Action(..)) where

import Country exposing (Country(..))
import Board   exposing (Board)
import Orders  exposing (Orders)

type Action =
  SetOrders Country Orders |
  GetBoardRequest |
  GetBoardResponse (Maybe Board) |
  PostOrdersRequest |
  PostOrdersResponse (Maybe Board)
