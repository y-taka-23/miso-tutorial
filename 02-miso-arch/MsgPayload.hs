{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Main where

import           Miso
import           Miso.String

type Model = Int

data Action = NoOp | Increment Int

updateModel :: Action -> Model -> Effect Action Model
updateModel NoOp          m = noEff m
updateModel (Increment n) m = noEff (m + n)

viewModel :: Model -> View Action
viewModel model = div_ []
        [ button_ [ onClick (Increment 2) ] [ text "+" ]
        , text . ms $ show model
        ]

main :: IO ()
main = startApp App {..}
    where
        initialAction = NoOp
        model = 0
        update = updateModel
        view = viewModel
        subs = []
        events = defaultEvents
        mountPoint = Nothing
