module Models.Time (Year, Phase, Season, Time, time) where

import String                exposing (toLower)
import Maybe                 exposing (withDefault)
import Json.Decode as Decode exposing (Decoder, map, object3, (:=), int, string)

type alias Year =
  Int

year : Decoder Year
year =
  int

type Season =
  Spring |
  Fall

stringSeason : String -> Maybe Season
stringSeason string =
  case toLower string of
    "s" ->
      Just Spring
    "f" ->
      Just Fall
    _ ->
      Nothing

season : Decoder Season
season =
  map (stringSeason >> withDefault Spring) string

type Phase =
  Diplomacy |
  Resolution |
  Adjustment

stringPhase : String -> Maybe Phase
stringPhase string =
  case toLower string of
    "d" ->
      Just Diplomacy
    "r" ->
      Just Resolution
    "a" ->
      Just Adjustment
    _ ->
      Nothing

phase : Decoder Phase
phase =
  map (stringPhase >> withDefault Diplomacy) string

type alias Time =
  {
    year : Year,
    season : Season,
    phase : Phase
  }

time : Decoder Time
time =
  object3 Time
    ("year" := year)
    ("season" := season)
    ("phase" := phase)
