module Model where

data Model = Model
    { players :: [Player]
    } deriving (Eq, Show)

initialModel :: Model
initialModel = Model
    { players = [ Player "1" "Sum" 1 ]
    }

type PlayerId = String

data Player = Player
    { ident :: PlayerId
    , name  :: String
    , level :: Int
    } deriving (Eq, Show)
