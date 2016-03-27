module App (main) where

import Effects  exposing (Never, task)
import Html     exposing (Html)
import StartApp exposing (App, start)
import Task     exposing (Task, succeed)

import Actions  exposing (Action(..))
import Server   exposing (Server)
import GameId   exposing (GameId)
import Model    exposing (Model, model)
import Update   exposing (update)
import View     exposing (view)
import Inputs   exposing (inputs)

port server : Server

port gameId : GameId

port tasks : Signal (Task Never ())
port tasks =
  app.tasks

app : App Model
app =
  start
    {
      init =
        (
          model server gameId,
          task <| succeed GetBoardRequest
        ),
      update = update,
      view = view,
      inputs = inputs
    }

main : Signal Html
main =
  app.html
