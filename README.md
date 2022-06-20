# go-docker
Simple [Go](https://github.com/golang/go) API using the [Gin HTTP framework](https://github.com/gin-gonic/gin) containerised using [Docker](https://www.docker.com).

All you have to do is clone this repo and run the following commands:<br>
`docker build -t go-docker -f Dockerfile .` <br>
`docker run -d -p 8080:8080 go-docker` <br>
`curl localhost:8080`

You should see the following output from the curl command:<br>
```OK```
