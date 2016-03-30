module View (view) where

import Html                          exposing (Html, div, button, text, textarea)
import Html.Events     as Events     exposing (onClick, on, targetValue)
import Html.Attributes as Attributes exposing (value)
import Signal                        exposing (Address, message)

import Model                         exposing (Model)
import Models.Country  as Country    exposing (Country(..))
import Models.Orders   as Orders     exposing (Orders)
import Actions                       exposing (Action(..))

orders : Address Action -> Country -> Orders -> Html
orders address country orders =
  div []
    [
      textarea
        [
          value orders,
          on "input" targetValue (SetOrders country >> message address)
        ] []
    ]

view : Address Action -> Model -> Html
view address model =
  div []
    [
      text <| toString model.time,
      text <| toString model.provinces,
      orders address Austria model.austria,
      orders address England model.england,
      orders address France model.france,
      orders address Germany model.germany,
      orders address Italy model.italy,
      orders address Russia model.russia,
      orders address Turkey model.turkey,
      button [onClick address PostOrdersRequest] [text "Orders"]
    ]
