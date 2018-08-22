{-# LANGUAGE DataKinds, TypeFamilies, TypeOperators, FlexibleContexts, ScopedTypeVariables #-}

module Types where

import Java

----

data ClientConfig = ClientConfig @com.hazelcast.client.config.ClientConfig
    deriving Class

foreign import java unsafe "@new" newClientConfig :: Java a ClientConfig

foreign import java unsafe getGroupConfig :: Java ClientConfig GroupConfig

---

data GroupConfig = GroupConfig @com.hazelcast.config.GroupConfig
    deriving Class


foreign import java unsafe setName :: JString -> Java GroupConfig GroupConfig

foreign import java unsafe setPassword :: JString -> Java GroupConfig GroupConfig

---

data HazelcastInstance = HazelcastInstance @com.hazelcast.core.HazelcastInstance
    deriving Class

data HazelcastClient = HazelcastClient @com.hazelcast.client.HazelcastClient
    deriving Class

foreign import java unsafe "@static com.hazelcast.client.HazelcastClient.newHazelcastClient"
    newHazelcastClient :: ClientConfig -> Java a HazelcastInstance

foreign import java unsafe "@interface" getMap :: JString -> Java HazelcastInstance (IMap k v)

----
data IMap k v = IMap (@com.hazelcast.core.IMap k v)
    deriving Class

type instance Inherits (IMap k v) = '[Map k v]
