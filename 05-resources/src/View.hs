module View where

import           Action
import           Model

import           Miso
import           Miso.String

viewModel :: Model -> View Action
viewModel m = div_ [] [ text (ms m) ]
