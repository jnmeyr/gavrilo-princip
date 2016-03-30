module Models.Provinces (Provinces, provinces) where

import Json.Decode     as Decode   exposing (Decoder, object1, object3, (:=), maybe, list, string)

import Models.Province as Province exposing (Province, province)
import Models.Country  as Country  exposing (Country(..), country)
import Models.Unit     as Unit     exposing (Unit, unit)

type alias Provinces =
  {
    provinces : List
      {
        province : Province,
        country : Maybe Country,
        unit : Maybe Unit
      }
  }

provinces : Decoder Provinces
provinces =
  object1 Provinces
    ("provinces" := list
      (object3 (\ province country unit -> { province = province, country = country, unit = unit })
        ("id" := province)
        ("country" := maybe country)
        ("unit" := maybe unit)))
