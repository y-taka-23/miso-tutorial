module Model where

data Model = Model
    { players :: Maybe [Player]
    } deriving (Eq, Show)

initialModel :: Model
initialModel = Model
    { players = Nothing
    }

type PlayerId = String

data Player = Player
    { ident :: PlayerId
    , name  :: String
    , level :: Int
    } deriving (Eq, Show)
