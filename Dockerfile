FROM golang:1.18 AS builder
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
WORKDIR /src/app
COPY . /src/app
RUN go mod download
RUN go  build -ldflags "-s -w" -o gst main.go

FROM ubuntu:latest
WORKDIR /service/bin
COPY --from=builder /src/app/gst /service/bin
ENTRYPOINT ["sleep","36000"]
