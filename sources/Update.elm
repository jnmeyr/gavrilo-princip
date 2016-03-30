module Update (update) where

import Effects                   exposing (Effects, none)

import Actions                   exposing (Action(..))
import Model                     exposing (Model)
import Models.Country as Country exposing (Country(..))
import Models.Orders  as Orders  exposing (Orders, orders)
import Communication             exposing (getTime, getProvinces, postOrders)

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
    GetTimeRequest ->
      (
        model,
        getTime model
      )
    GetTimeResponse (Just time) ->
      (
        {
          model |
          time = Just time
        },
        getProvinces model
      )
    GetProvincesRequest ->
      (
        model,
        getProvinces model
      )
    GetProvincesResponse (Just provinces) ->
      (
        {
          model |
          provinces = Just provinces
        },
        none
      )
    PostOrdersRequest ->
      (
        model,
        postOrders model
      )
    PostOrdersResponse (Just time) ->
      (
        {
          model |
          time = Just time,
          austria = orders,
          england = orders,
          france = orders,
          germany = orders,
          italy = orders,
          russia = orders,
          turkey = orders
        },
        getProvinces model
      )
    _ ->
      (
        model,
        none
      )
