#!/usr/bin/env bash

# 编译mac下可以执行文件
go build -ldflags "-s -w" -o gst-mac main.go

# 使用交叉编译 linux和windows版本可以执行的文件
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o gst-linux main.go
CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -ldflags "-s -w" -o gst-win.exe main.go
