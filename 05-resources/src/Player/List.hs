{-# LANGUAGE OverloadedStrings #-}
module Player.List where

import           Action
import           Model

import           Miso
import           Miso.String (ms)

viewPlayers :: [Player] -> View Action
viewPlayers ps = div_ []
    [ nav
    , list ps
    ]

nav :: View action
nav = div_
    [ class_ "clearfix mb2 white bg-black"]
    [ div_ [ class_ "left p2" ] [ text "Players" ] ]

list :: [Player] -> View action
list ps = div_
    [ class_ "p2" ]
    [ table_ []
        [ thead_ []
            [ tr_ []
                [ th_ [] [ text "Id" ]
                , th_ [] [ text "Name" ]
                , th_ [] [ text "Level" ]
                , th_ [] [ text "Actions" ]
                ]
            ]
        , tbody_ [] $ map playerRow ps
        ]
    ]

playerRow :: Player -> View action
playerRow p = tr_ []
    [ th_ [] [ text . ms $ ident p]
    , th_ [] [ text . ms $ name p]
    , th_ [] [ text . ms . show $ level p]
    , th_ [] []
    ]
