module App (main) where

import Effects                 exposing (Never, task)
import Html                    exposing (Html)
import StartApp                exposing (App, start)
import Task                    exposing (Task, succeed)

import Actions                 exposing (Action(..))
import Model                   exposing (Model, model)
import Models.Server as Server exposing (Server)
import Models.Game   as Game   exposing (Game)
import Update                  exposing (update)
import View                    exposing (view)
import Inputs                  exposing (inputs)

port server : Server

port game : Game

port tasks : Signal (Task Never ())
port tasks =
  app.tasks

app : App Model
app =
  start
    {
      init =
        (
          model server game,
          task <| succeed GetTimeRequest
        ),
      update = update,
      view = view,
      inputs = inputs
    }

main : Signal Html
main =
  app.html
