FROM golang

# Fetch dependencies
RUN go get github.com/tools/godep

# Add project directory to Docker image.
ADD . /go/src/github.com/lukaszle/goproj

ENV USER lukasz
ENV HTTP_ADDR :8888
ENV HTTP_DRAIN_INTERVAL 1s
ENV COOKIE_SECRET Uwi89Z2BQdbEBLPz

# Replace this with actual PostgreSQL DSN.
ENV DSN postgres://lukasz@localhost:5432/goproj?sslmode=disable

WORKDIR /go/src/github.com/lukaszle/goproj

RUN godep go build

EXPOSE 8888
CMD ./goproj