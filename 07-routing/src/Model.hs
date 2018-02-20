module Model where

import           Network.URI

data Model = Model
    { players    :: Either String [Player]
    , currentURI :: URI
    } deriving (Eq, Show)

initialModel :: URI -> Model
initialModel uri = Model
    { players = Left "Loading..."
    , currentURI = uri
    }

type PlayerId = String

data Player = Player
    { ident :: PlayerId
    , name  :: String
    , level :: Int
    } deriving (Eq, Show)
