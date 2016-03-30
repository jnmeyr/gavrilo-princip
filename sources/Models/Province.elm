module Models.Province (Province(..), province) where

import Maybe                 exposing (withDefault)
import String                exposing (toLower)
import Json.Decode as Decode exposing (Decoder, map, string)

type Province =
  Adr |
  Aeg |
  Alb |
  Ank |
  Apu |
  Arm |
  Bal |
  Bar |
  Bel |
  Ber |
  Bla |
  Boh |
  Bot |
  Bre |
  Bud |
  Bul |
  BulEc |
  BulSc |
  Bur |
  Cly |
  Con |
  Den |
  Eas |
  Edi |
  Eng |
  Fin |
  Gal |
  Gas |
  Gre |
  Hel |
  Hol |
  Ion |
  Iri |
  Kie |
  Lon |
  Lvn |
  Lvp |
  Lyo |
  Mao |
  Mar |
  Mos |
  Mun |
  Naf |
  Nao |
  Nap |
  Nor |
  Nth |
  Nwg |
  Par |
  Pic |
  Pie |
  Por |
  Pru |
  Rom |
  Ruh |
  Rum |
  Ser |
  Sev |
  Sil |
  Ska |
  Smy |
  Spa |
  SpaNc |
  SpaSc |
  Stp |
  StpNc |
  StpSc |
  Swe |
  Syr |
  Tri |
  Tun |
  Tus |
  Tyr |
  Tys |
  Ukr |
  Ven |
  Vie |
  Wal |
  War |
  Wes |
  Yor

stringProvince : String -> Maybe Province
stringProvince string =
  case toLower string of
    "adr" ->
      Just Adr
    "aeg" ->
      Just Aeg
    "alb" ->
      Just Alb
    "ank" ->
      Just Ank
    "apu" ->
      Just Apu
    "arm" ->
      Just Arm
    "bal" ->
      Just Bal
    "bar" ->
      Just Bar
    "bel" ->
      Just Bel
    "ber" ->
      Just Ber
    "bla" ->
      Just Bla
    "boh" ->
      Just Boh
    "bot" ->
      Just Bot
    "bre" ->
      Just Bre
    "bud" ->
      Just Bud
    "bul" ->
      Just Bul
    "bul-ec" ->
      Just BulEc
    "bul-sc" ->
      Just BulSc
    "bur" ->
      Just Bur
    "cly" ->
      Just Cly
    "con" ->
      Just Con
    "den" ->
      Just Den
    "eas" ->
      Just Eas
    "edi" ->
      Just Edi
    "eng" ->
      Just Eng
    "fin" ->
      Just Fin
    "gal" ->
      Just Gal
    "gas" ->
      Just Gas
    "gre" ->
      Just Gre
    "hel" ->
      Just Hel
    "hol" ->
      Just Hol
    "ion" ->
      Just Ion
    "iri" ->
      Just Iri
    "kie" ->
      Just Kie
    "lon" ->
      Just Lon
    "lvn" ->
      Just Lvn
    "lvp" ->
      Just Lvp
    "lyo" ->
      Just Lyo
    "mao" ->
      Just Mao
    "mar" ->
      Just Mar
    "mos" ->
      Just Mos
    "mun" ->
      Just Mun
    "naf" ->
      Just Naf
    "nao" ->
      Just Nao
    "nap" ->
      Just Nap
    "nor" ->
      Just Nor
    "nth" ->
      Just Nth
    "nwg" ->
      Just Nwg
    "par" ->
      Just Par
    "pic" ->
      Just Pic
    "pie" ->
      Just Pie
    "por" ->
      Just Por
    "pru" ->
      Just Pru
    "rom" ->
      Just Rom
    "ruh" ->
      Just Ruh
    "rum" ->
      Just Rum
    "ser" ->
      Just Ser
    "sev" ->
      Just Sev
    "sil" ->
      Just Sil
    "ska" ->
      Just Ska
    "smy" ->
      Just Smy
    "spa" ->
      Just Spa
    "spa-nc" ->
      Just SpaNc
    "spa-sc" ->
      Just SpaSc
    "stp" ->
      Just Stp
    "stp-nc" ->
      Just StpNc
    "stp-sc" ->
      Just StpSc
    "swe" ->
      Just Swe
    "syr" ->
      Just Syr
    "tri" ->
      Just Tri
    "tun" ->
      Just Tun
    "tus" ->
      Just Tus
    "tyr" ->
      Just Tyr
    "tys" ->
      Just Tys
    "ukr" ->
      Just Ukr
    "ven" ->
      Just Ven
    "vie" ->
      Just Vie
    "wal" ->
      Just Wal
    "war" ->
      Just War
    "wes" ->
      Just Wes
    "yor" ->
      Just Yor
    _ ->
      Nothing

province : Decoder Province
province =
  map (stringProvince >> withDefault Adr) string