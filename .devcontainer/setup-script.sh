#!/bin/sh -xe

cd $(dirname $0)

sudo rm -rf /etc/localtime
sudo ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
sudo pip install --upgrade pip
sudo pip3 install --user -r ./notebooks/requirements.txt
sudo curl -fsSL https://deb.nodesource.com/setup_19.x | sudo bash -
sudo apt-get install -y nodejs
../powerlevel10k/install.sh; 

sudo dockerd &
set +e
while [ $EXIT_CODE_DOCKER_PS -ne "0" ]; do
    docker ps
    EXIT_CODE_DOCKER_PS=$?
    sleep 1;
done
set -e
cd ../app
./run.sh
