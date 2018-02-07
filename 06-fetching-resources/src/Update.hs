module Update where

import           Miso

import           Action
import           Model

updateModel :: Action -> Model -> Effect Action Model
updateModel FetchPlayers m    = noEff m
updateModel (SetPlayers ps) m = noEff m
updateModel NoOp m            = noEff m
