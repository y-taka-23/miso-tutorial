{-# LANGUAGE RecordWildCards #-}
module Main where

import qualified Data.Set    as S
import           Miso
import           Miso.String

type Model = Int

data Action = KeyDown | NoOp

updateModel :: Action -> Model -> Effect Action Model
updateModel KeyDown m = noEff (m + 2)
updateModel NoOp    m = noEff m

viewModel :: Model -> View Action
viewModel m = div_ [] [ text . ms $ show m ]

-- it reacts only to keyup
keyDown :: S.Set Int -> Action
keyDown keys = if S.null keys then KeyDown else NoOp

main :: IO ()
main = startApp App {..}
    where
        initialAction = NoOp
        model = 0
        update = updateModel
        view = viewModel
        subs = [ keyboardSub keyDown ]
        events = defaultEvents
        mountPoint = Nothing
