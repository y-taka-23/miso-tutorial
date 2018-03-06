module Action where

import           Network.URI

import           Model

data Action
    = FetchPlayers
    | SetPlayers (Either String [Player])
    | HandleURI URI
    | ChangeURI URI
    | ChangeLevel Player Int
    | NoOp
