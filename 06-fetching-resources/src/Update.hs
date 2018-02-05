module Update where

import           Miso

import           Action
import           Model

updateModel :: Action -> Model -> Effect Action Model
updateModel NoOp m = noEff m
