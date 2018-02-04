module View where

import           Action
import           Model
import           Player.List

import           Miso

viewModel :: Model -> View Action
viewModel m = div_ [] [ page m ]

page :: Model -> View Action
page m = viewPlayers $ players m
