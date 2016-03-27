module Board (Board, board) where

import Json.Decode exposing (Decoder, object2, object3, (:=), maybe, list, int, string)

type alias Time =
  {
    year : Int,
    season : String,
    phase : String
  }

time : Decoder Time
time =
  object3 Time
    ("year" := int)
    ("season" := string)
    ("phase" := string)

type alias Unit =
  {
    kind : String,
    country : String
  }

unit : Decoder Unit
unit =
  object2 Unit
    ("kind" := string)
    ("country" := string)

type alias Field =
  {
    id : String,
    country : Maybe String,
    unit : Maybe Unit
  }

field : Decoder Field
field =
  object3 Field
    ("id" := string)
    ("country" := maybe string)
    ("unit" := maybe unit)

type alias Board =
  {
    time : Time,
    fields : List Field
  }

board : Decoder Board
board =
  object2 Board
    ("time" := time)
    ("fields" := list field)
