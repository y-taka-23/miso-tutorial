module Update where

import           Miso

import           Action
import           Effect
import           Model

updateModel :: Action -> Model -> Effect Action Model
updateModel FetchPlayers m = m <# do
    SetPlayers <$> fetchPlayers
updateModel (SetPlayers ePs) m = noEff m { players = ePs }
updateModel NoOp m = noEff m
