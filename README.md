# How to use go mod with gRPC 

I followed [the official "hello world" example](https://github.com/grpc/grpc-go/blob/master/examples/helloworld/greeter_server/main.go) code. But, I couldn't make it work with go mod easily.

The major problem was this line. It is likely that the API was removed etc.

```console
In server/main.rs, comment this.
// pb.UnimplementedGreeterServer
```

I had to inspect what happend to "UnimplementedGreeterServer" by reading **pb** in helloworld/helloworld.pb.go. You can see that you can not find it there.

## How to reproduce working code example.

```console
$go mod init steadylearner.com/grpc
$go get github.com/golang/protobuf
$google.golang.org/grpc v1.28.0
```

Install what lack here if necessary. [You can refer to the GitHub page for it.](https://github.com/grpc/grpc-go)

Then, you can use this to build protobuf file.

```console
protoc -I helloworld/ helloworld/helloworld.proto --go_out=plugins=grpc:helloworld
```

Everything is ready. First, run gRPC server with **$go run main.rs** in current folder. Then, **$cd client && go run main.rs** in another kernel. 

You will see **Received: world** at the server and **Greeting: Hello world** from the client.

## Conclusion

[I should have read this blog first.](https://towardsdatascience.com/grpc-in-golang-bb40396eb8b1)
