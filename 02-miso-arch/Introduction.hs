{-# LANGUAGE RecordWildCards #-}
module Main where

import           Miso
import           Miso.String

type Model = String

data Action = NoOp

updateModel :: Action -> Model -> Effect Action Model
updateModel NoOp m = noEff m

viewModel :: Model -> View Action
viewModel model = text $ ms model

main :: IO ()
main = startApp App {..}
    where
        initialAction = NoOp
        model = "Hello"
        update = updateModel
        view = viewModel
        subs = []
        events = defaultEvents
        mountPoint = Nothing
