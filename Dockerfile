# syntax=docker/dockerfile:1
# Build
FROM golang:1.18-buster AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /go-docker

## Release
FROM gcr.io/distroless/base-debian10
ENV GIN_MODE=release                                                                                                    

WORKDIR /

COPY --from=build /go-docker /go-docker

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/go-docker"]