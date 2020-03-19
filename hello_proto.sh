# I used this to make the file from helloworld.proto in the current repository. 
protoc -I api/ api/helloworld.proto --go_out=plugins=grpc:api

# 1. When you don't use go mod, $protoc -I api/ api/helloworld.proto --go_out=plugins=grpc:api

# 2. When you use go mod,

# protoc -I. —go_out=plugins=grpc,paths=source_relative:. *.proto
