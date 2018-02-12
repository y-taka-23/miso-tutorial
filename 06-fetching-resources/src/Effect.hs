{-# LANGUAGE OverloadedStrings #-}
module Effect where

import           Data.Aeson
import           Model

fetchPlayers :: IO [Player]
fetchPlayers = pure []

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
