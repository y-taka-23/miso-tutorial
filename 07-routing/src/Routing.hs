{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}
module Routing where

import           Data.Proxy
import           Miso
import           Servant.API

import           Action

type Route =
         TopRoute
    :<|> ListRoute
    :<|> EditRoute

type TopRoute = View Action

type ListRoute = "players" :> View Action

type EditRoute = "players" :> Capture "ident" String :> View Action

topRoute :: Proxy TopRoute
topRoute = Proxy

listRoute :: Proxy ListRoute
listRoute = Proxy

editRoute :: Proxy EditRoute
editRoute = Proxy
