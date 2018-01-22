{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Main where

import           Miso
import           Miso.String
import           System.Random (randomRIO)

type Model = Int

data Action = NoOp | Roll | OnResult Int

updateModel :: Action -> Model -> Effect Action Model
updateModel NoOp m = noEff m
updateModel Roll m = m <# do
    spots <- randomRIO (1, 6) :: IO Int
    return $ OnResult spots
updateModel (OnResult spots) _ = noEff spots

viewModel :: Model -> View Action
viewModel m = div_ []
    [ button_ [ onClick Roll] [ text "Roll" ]
    , text . ms $ show m
    ]

main :: IO ()
main = startApp App {..}
    where
        initialAction = NoOp
        model = 1
        update = updateModel
        view = viewModel
        subs = []
        events = defaultEvents
        mountPoint = Nothing
