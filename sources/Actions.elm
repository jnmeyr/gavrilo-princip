module Actions (Action(..)) where

import Models.Time      as Time      exposing (Time)
import Models.Country   as Country   exposing (Country(..))
import Models.Provinces as Provinces exposing (Provinces)
import Models.Orders    as Orders    exposing (Orders)

type Action =
  SetOrders Country Orders |
  GetTimeRequest |
  GetTimeResponse (Maybe Time) |
  GetProvincesRequest |
  GetProvincesResponse (Maybe Provinces) |
  PostOrdersRequest |
  PostOrdersResponse (Maybe Time)
