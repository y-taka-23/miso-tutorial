{-# LANGUAGE RecordWildCards #-}
module Main where

import           Miso

import           Action
import           Model
import           Update
import           View

main :: IO ()
main = startApp App {..}
    where
        initialAction = FetchPlayers
        model = initialModel
        update = updateModel
        view = viewModel
        subs = []
        events = defaultEvents
        mountPoint = Nothing
