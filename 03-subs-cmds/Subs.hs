{-# LANGUAGE RecordWildCards #-}
module Main where

import           Miso
import           Miso.String

type Model = Int

data Action = KeyDown | NoOp

updateModel :: Action -> Model -> Effect Action Model
updateModel KeyDown m = noEff (m + 2)
updateModel NoOp    m = noEff m

viewModel :: Model -> View Action
viewModel m = div_ [] [ text . ms $ show m ]

subscriptions :: [Sub Action Model]
subscriptions = [ keyboardSub (const KeyDown) ]

main :: IO ()
main = startApp App {..}
    where
        initialAction = NoOp
        model = 0
        update = updateModel
        view = viewModel
        subs = subscriptions
        events = defaultEvents
        mountPoint = Nothing
