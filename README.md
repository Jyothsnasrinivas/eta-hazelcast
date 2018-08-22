
<h1 align="center">Hazelcast example in Eta</h1>

[Hazelcast](https://hazelcast.org/) is a distributed data system. It supports high scalability and data distribution in a clustered environment.</h2>

In this example we will create a cluster member, distributed Map to share Map data among the cluster nodes and create a client to connect and query data in the cluster.

**Maven Dependencies**

The maven dependencies for Hazelcast Cluster Member and Hazelcast Java Client are added in the `eta-hazelcast.cabal` file.

```cabal
maven-depends:       com.hazelcast:hazelcast:3.10
...
maven-depends:       com.hazelcast:hazelcast:3.10, com.hazelcast:hazelcast-client:3.10

```

## Running the server

1) Fire up the terminal and enter the commands:

  ```
  $ git clone https://github.com/Jyothsnasrinivas/eta-hazelcast.git
  $ cd eta-hazelcast
  $ etlas run hazelcast-server
  ```

2) When we start the `hazelcast-server` application, we can see the flowing text in the console.

```bash
Members {size:1, ver:1} [
	Member [192.168.0.104]:5701 - 564aa798-70a8-48d8-8ef9-c0590adb853b this
]
```

3) To create multiple nodes we can start the multiple instances of `hazelcast-server`. That means open up another terminal instance and run the command `etlas run hazelcast-server` simultaneously with the first instance. You will notice the following log in the console.

```bash
Members {size:2, ver:2} [
	Member [192.168.0.104]:5701 - 564aa798-70a8-48d8-8ef9-c0590adb853b this
	Member [192.168.0.104]:5702 - e2d32f12-b7af-4991-8c9d-3b8f85f197a9
]
```

## Running the client

1) Fire up another terminal instance and enter the command.

```
$ etlas run hazelcast-client
```

2) You can try few more instances to see Hazelcast work.


**Credits**

This example is inspired from the [Hazelcast tutorial](https://github.com/eugenp/tutorials/tree/master/hazelcast) by [Eugen](https://github.com/eugenp).
