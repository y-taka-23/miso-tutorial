module Action where

import           Model

data Action
    = FetchPlayers
    | SetPlayers (Either String [Player])
    | NoOp
