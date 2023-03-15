#!/usr/bin/env bash

# 编译mac下可以执行文件
# 下载工具resourcehacker，zip版本解压（http://www.angusj.com/resourcehacker/）
# 加图标命令：ResourceHacker -open main.exe -save output.exe -action addskip -res main.ico -mask ICONGROUP,MAIN,

go build -ldflags "-s -w" -o gst-mac main.go

# 使用交叉编译 linux和windows版本可以执行的文件
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o gst-linux main.go
CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -ldflags "-s -w" -o gst-win.exe main.go
