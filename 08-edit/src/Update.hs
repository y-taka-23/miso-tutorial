module Update where

import           Miso

import           Action
import           Effect
import           Model

updateModel :: Action -> Model -> Effect Action Model
updateModel FetchPlayers m = m <# do
    SetPlayers <$> fetchPlayers
updateModel (SetPlayers ePs) m = noEff m { players = ePs }
updateModel (ChangeURI uri) m = m <# do
    pushURI uri >> pure NoOp
updateModel (HandleURI uri) m = noEff m { currentURI = uri }
updateModel NoOp m = noEff m
