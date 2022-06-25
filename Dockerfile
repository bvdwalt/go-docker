# syntax=docker/dockerfile:1
# Build container
FROM golang:1.18-buster AS build

WORKDIR /app

COPY . .
RUN go mod download
RUN go mod verify

RUN CGO_ENABLED=0 go build -o /go-docker

## Release container
FROM gcr.io/distroless/static-debian11
ENV GIN_MODE=release                                                                                                    

WORKDIR /

COPY --from=build /go-docker /go-docker

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/go-docker"]