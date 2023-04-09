#!/bin/sh -x

cd $(dirname $0)

# https://nodejs.org/en/docs/guides/nodejs-docker-webapp

WHOAMI=$(whoami)

docker build . -t $(whoami)/node-web-app

docker images

docker run -p 49160:8080 -d $WHOAMI/node-web-app

# Get container ID
docker ps

# https://stackoverflow.com/questions/34496882/get-docker-container-id-from-container-name

DOCKER_CONTAINER_ID=$(docker ps --format "{{.Names}}")

docker ps -aqf "name=$DOCKER_CONTAINER_ID" | tail -1

# Print app output
docker logs $DOCKER_CONTAINER_ID

# Example
# Running on http://localhost:8080

# Enter the container
# docker exec -it $DOCKER_CONTAINER_ID /bin/bash

docker ps

curl -i localhost:49160

exit 0
