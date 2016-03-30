module Models.Unit (Kind, Unit, unit) where

import String                    exposing (toLower)
import Maybe                     exposing (withDefault)
import Json.Decode    as Decode  exposing (Decoder, map, object2, (:=), string)

import Models.Country as Country exposing (Country(..), country)

type Kind =
  Army |
  Fleet

stringKind : String -> Maybe Kind
stringKind string =
  case toLower string of
    "a" ->
      Just Army
    "f" ->
      Just Fleet
    _ ->
      Nothing

kind : Decoder Kind
kind =
  map (stringKind >> withDefault Army) string

type alias Unit =
  {
    kind : Kind,
    country : Country
  }

unit : Decoder Unit
unit =
  object2 Unit
    ("kind" := kind)
    ("country" := country)
