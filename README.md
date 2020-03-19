# How to use go mod with gRPC 

I followed [the official "hello world" example](https://github.com/grpc/grpc-go/blob/master/examples/helloworld/greeter_server/main.go) code to make this work. But, couldn't make it easily.

The major problem was this line. It is likely the API is changed etc.

```console
In server/main.rs, comment this.
// pb.UnimplementedGreeterServer
```

I should inspect what happend to "UnimplementedGreeterServer" by inspecting **pb**.

## How to reproduce working code example.

```console
$go mod init steadylearner.com/grpc
$go get github.com/golang/protobuf
$google.golang.org/grpc v1.28.0
```

[Install what lacks here while you refer to the GitHub page for it.](https://github.com/grpc/grpc-go)

Then, you can use this to build protobuf file.

```console
protoc -I helloworld/ helloworld/helloworld.proto --go_out=plugins=grpc:helloworld
```

Everything is ready. 

First, run gRPC server with **$go run main.rs** in current folder. Then, **$cd client && go run main.rs** in another kernel. 

You will see **Received: world** at the client part.
