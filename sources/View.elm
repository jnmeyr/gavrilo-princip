module View (view) where

import Html                           exposing (Html, fromElement, div, button, text, textarea, h1, span)
import Html.Events      as Events     exposing (onClick, on, targetValue)
import Html.Attributes  as Attributes exposing (style, value, placeholder)
import Graphics.Element as Element    exposing (image, layers, centered, container, middle)
import Signal                         exposing (Address, message)

import Model                          exposing (Model)
import Models.Country   as Country    exposing (Country(..))
import Models.Orders    as Orders     exposing (Orders)
import Models.Time      as Time       exposing (Time)
import Actions                        exposing (Action(..))

time : Maybe Time -> Html
time time =
  h1
  [
    style
      [
        ("width", "100%"),
        ("height", "100%"),
        ("padding", "0"),
        ("margin", "0"),
        ("text-align", "center")
      ]
  ]
  (case time of
    Just time ->
      [
        span [] <| [text <| toString time.season],
        text " ",
        span [] <| [text <| toString time.year],
        text " (",
        span [] <| [text <| toString time.phase],
        text ")"
      ]
    Nothing ->
      [
        text "..."
      ])

orders : Address Action -> Country -> Orders -> Html
orders address country orders =
  div []
    [
      textarea
        [
          style
            [
              ("width", "100%"),
              ("height", "100px"),
              ("resize", "none")
            ],
          placeholder <| toString country,
          value orders,
          on "input" targetValue (SetOrders country >> message address)
        ] []
    ]

view : Address Action -> Model -> Html
view address model =
  div []
    [
      div
        [
          style
            [
              ("width", "100%"),
              ("height", "100%"),
              ("padding", "0"),
              ("margin", "0")
            ]
        ]
        [
          time model.time
        ],
      div
        [
          style
            [
              ("display", "flex")
            ]
        ]
        [
          div
            [
              style
                [
                  ("width", "800px")
                ]
            ]
            [
              fromElement <| image 800 800 "resources/map.png"
            ],
          div
            [
              style
                [
                  ("flex-grow", "1")
                ]
            ]
            [
              orders address Austria model.austria,
              orders address England model.england,
              orders address France model.france,
              orders address Germany model.germany,
              orders address Italy model.italy,
              orders address Russia model.russia,
              orders address Turkey model.turkey,
              button [onClick address PostOrdersRequest] [text "Order"]
            ]
        ],
      div []
        [
          text <| toString model.provinces
        ]
    ]
