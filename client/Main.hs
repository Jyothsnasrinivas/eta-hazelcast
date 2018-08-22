{-# LANGUAGE ScopedTypeVariables, OverloadedStrings #-}
module Main where

import Types
import Control.Monad (forM_)
import Java

main :: IO ()
main = java $ do
    config <- newClientConfig
    groupConfig <- config <.> getGroupConfig
    groupConfig <.> setName "dev"
    groupConfig <.> setPassword "dev-pass"
    hazelcastInstanceClient <- newHazelcastClient config
    (m :: IMap JLong JString) <- hazelcastInstanceClient <.> getMap "data"
    forM_ (fromJava (superCast m :: Map JLong JString) :: [(JLong, JString)]) $ \(k, v) -> do
      io $ putStrLn $ "Key: " <> show k <> " Value: " <> show v
    return()
