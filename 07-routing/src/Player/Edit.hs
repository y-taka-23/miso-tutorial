{-# LANGUAGE OverloadedStrings #-}
module Player.Edit where

import           Miso
import           Miso.String (ms)

import           Action
import           Model

viewPlayer :: Player -> View Action
viewPlayer p = div_ []
    [ nav
    , form p
    ]

nav :: View Action
nav = div_
    [ class_ "clearfix mb2 white bg-black p1" ]
    []

form :: Player -> View Action
form p = div_
    [ class_ "m3" ]
    [ h1_ [] [ text . ms $ name p ]
    , formLevel p
    ]

formLevel :: Player -> View Action
formLevel p = div_
    [ class_ "clearfix py1" ]
    [ div_ [ class_ "col col-5" ] [ text "Level" ]
    , div_
        [ class_ "col col-7" ]
        [ span_ [ class_ "h2 bold" ] [ text . ms . show $ level p ]
        , btnLevelDecrease p
        , btnLevelIncrease p
        ]
    ]

btnLevelDecrease :: Player -> View Action
btnLevelDecrease p = a_
    [ class_ "btn ml1 h1" ]
    [ i_ [ class_ "fa fa-minus-circle" ] [] ]

btnLevelIncrease :: Player -> View Action
btnLevelIncrease p = a_
    [ class_ "btn ml1 h1" ]
    [ i_ [ class_ "fa fa-plus-circle" ] [] ]
