module View (view) where

import Html                          exposing (Html, div, button, text, textarea)
import Html.Events as Events         exposing (onClick, on, targetValue)
import Html.Attributes as Attributes exposing (value)
import Signal                        exposing (Address, message)

import Model                         exposing (Model)
import Actions                       exposing (Action(..))

view : Address Action -> Model -> Html
view address model =
  div []
    [
      text <| toString model.board,
      div []
        [
          textarea
            [
              value model.orders,
              on "input" targetValue (SetOrders >> message address)
            ] []
        ],
      button [onClick address PostOrdersRequest] [text "Orders"]
    ]
