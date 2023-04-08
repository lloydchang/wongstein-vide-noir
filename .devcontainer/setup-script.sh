#!/bin/sh -x

cd $(dirname $0)

# https://notes.alexkehayias.com/running-docker-compose-in-codespaces/

# Assumes docker-compose.yaml is at the root /app root
# cd app
# This setup script depends on running some code in other containers
sudo dockerd &
# Ugh yes there's no nice way to wait until dockerd is ready
# sleep 5
while [ test -z /var/run/docker.sock ]; do
    sleep 1;
done
cd ../app
./run.sh
# Do whatever setup you need
# docker-compose up -d
# docker-compose exec {some command to run migrations etc}
# If you need to use docker for this setup script you must stop all containers
# otherwise, any servers running in docker will not have their ports
# forwarded properly by codespaces.
# docker-compose stop
