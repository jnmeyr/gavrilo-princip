module Models.Country (Country(..), country) where

import String                exposing (toLower)
import Maybe                 exposing (withDefault)
import Json.Decode as Decode exposing (Decoder, map, string)

type Country =
  Austria |
  England |
  France |
  Germany |
  Italy |
  Russia |
  Turkey

stringCountry : String -> Maybe Country
stringCountry string =
  case toLower string of
    "a" ->
      Just Austria
    "e" ->
      Just England
    "f" ->
      Just France
    "g" ->
      Just Germany
    "i" ->
      Just Italy
    "r" ->
      Just Russia
    "t" ->
      Just Turkey
    _ ->
      Nothing

country : Decoder Country
country =
  map (stringCountry >> withDefault Austria) string
