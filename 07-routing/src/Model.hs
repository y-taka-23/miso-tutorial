module Model where

data Model = Model
    { players :: Either String [Player]
    } deriving (Eq, Show)

initialModel :: Model
initialModel = Model
    { players = Left "Loading..."
    }

type PlayerId = String

data Player = Player
    { ident :: PlayerId
    , name  :: String
    , level :: Int
    } deriving (Eq, Show)
