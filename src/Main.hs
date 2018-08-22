{-# LANGUAGE ScopedTypeVariables, OverloadedStrings #-}
module Main where

import Java
import Control.Monad (forM_)
import Types

main :: IO ()
main = java $ do
  hzInstance <- newHazelcastInstance
  (m :: IMap JLong JString) <- hzInstance <.> getMap "data"
  idGenerator <- hzInstance <.> getIdGenerator "newid"
  forM_ [0..9] $ \i -> do
    nID <- idGenerator <.> newId
    m <.> putIMap (toJava nID :: JLong) (toJString ("message" <> show i))
  return ()
