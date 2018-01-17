{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Main where

import           Miso

type Model = Bool

data Action = NoOp | Expand | Collapse

updateModel :: Action -> Model -> Effect Action Model
updateModel NoOp     m = noEff m
updateModel Expand   _ = noEff True
updateModel Collapse _ = noEff False

viewModel :: Model -> View Action
viewModel model
    | model = div_ []
        [ button_ [ onClick Expand ] [ text "Expand" ]
        ]
    | otherwise = div_ []
        [ button_ [ onClick Collapse ] [ text "Collapse" ]
        , text "Widget"
        ]

main :: IO ()
main = startApp App {..}
    where
        initialAction = NoOp
        model = False
        update = updateModel
        view = viewModel
        subs = []
        events = defaultEvents
        mountPoint = Nothing
