module Update where

import           Miso

import           Action
import           Effect
import           Model

updateModel :: Action -> Model -> Effect Action Model
updateModel FetchPlayers m = m <# do
    SetPlayers <$> fetchPlayers
updateModel (SetPlayers ps) m = noEff m { players = Just ps }
updateModel NoOp m            = noEff m
