{-# LANGUAGE RecordWildCards #-}
module Main where

import           Miso

import           Action
import           Model
import           Update
import           View

main :: IO ()
main = do
    uri <- getCurrentURI
    startApp App { model = initialModel uri, .. }
    where
        initialAction = FetchPlayers
        update = updateModel
        view = viewModel
        subs = []
        events = defaultEvents
        mountPoint = Nothing
