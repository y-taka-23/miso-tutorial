module Action where

import           Model

data Action
    = FetchPlayers
    | SetPlayers [Player]
    | NoOp
