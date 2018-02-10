{-# LANGUAGE OverloadedStrings #-}
module Model where

import           Data.Aeson

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

instance FromJSON Player where
    parseJSON = withObject "Player" $ \v -> Player
        <$> v .: "id"
        <*> v .: "name"
        <*> v .: "level"

instance ToJSON Player where
    toJSON (Player ident name level) = object
        [ "id"    .= ident
        , "name"  .= name
        , "level" .= level
        ]
