{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Main where

import           Miso

type Model = ()

data Action = NoOp

updateModel :: Action -> Model -> Effect Action Model
updateModel NoOp m = noEff m

viewModel :: Model -> View Action
viewModel _ = text "Hello"

main :: IO ()
main = startApp App {..}
    where
        initialAction = NoOp
        model = ()
        update = updateModel
        view = viewModel
        subs = []
        events = defaultEvents
        mountPoint = Nothing
