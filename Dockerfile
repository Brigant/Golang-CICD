FROM golang:alpine3.18 as builder
LABEL authors="Brigant"

COPY . /opt/app

WORKDIR /opt/app

RUN go build -o test-cicd cmd/main.go

FROM alpine:3.18
LABEL authors="Brigant"

COPY --from=builder /opt/app/test-cicd /opt/app/test-cicd

WORKDIR /opt/app

EXPOSE 7000

ENTRYPOINT ./test-cicd
