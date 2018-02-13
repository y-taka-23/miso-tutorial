{-# LANGUAGE OverloadedStrings #-}
module Effect where

import           Data.Aeson
import           JavaScript.Web.XMLHttpRequest
import           Model

fetchPlayers :: IO (Either String [Player])
fetchPlayers = do
    Just json <- contents <$> xhrByteString req
    pure $ eitherDecodeStrict json
    where
        req = Request
            { reqMethod = GET
            , reqURI = "http://localhost:4000/players"
            , reqLogin = Nothing
            , reqHeaders = []
            , reqWithCredentials = False
            , reqData = NoData
            }

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
