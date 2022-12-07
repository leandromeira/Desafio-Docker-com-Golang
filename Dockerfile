FROM golang:latest AS builder

WORKDIR /opt/app

RUN go mod init example/hello
COPY hello.go /opt/app/
RUN go build .

FROM scratch
WORKDIR /opt/app
COPY --from=builder /opt/app/hello .
CMD ["./hello"]