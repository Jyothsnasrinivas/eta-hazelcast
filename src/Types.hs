{-# LANGUAGE DataKinds, TypeFamilies, TypeOperators, FlexibleContexts, ScopedTypeVariables #-}

module Types where

import Java

---

data HazelcastInstance = HazelcastInstance @com.hazelcast.core.HazelcastInstance
    deriving Class

foreign import java unsafe "@interface" getMap :: JString -> Java HazelcastInstance (IMap k v)

foreign import java unsafe "@interface" getIdGenerator :: JString -> Java HazelcastInstance IdGenerator

---

data Hazelcast = Hazelcast @com.hazelcast.core.Hazelcast
    deriving Class

foreign import java unsafe "@static com.hazelcast.core.Hazelcast.newHazelcastInstance"
   newHazelcastInstance :: Java a HazelcastInstance
---

data IdGenerator = IdGenerator @com.hazelcast.core.IdGenerator
    deriving Class

foreign import java unsafe "@interface" newId :: Java IdGenerator Int64
---
data IMap k v = IMap (@com.hazelcast.core.IMap k v)
    deriving Class

foreign import java unsafe "@interface put" putIMap
      :: (k <: Object, v <: Object) => k -> v -> Java (IMap k v) v
