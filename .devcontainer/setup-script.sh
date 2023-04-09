#!/bin/sh -xe

cd $(dirname $0)

sudo rm -rf /etc/localtime
sudo ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
../powerlevel10k/install.sh
sudo pip install --upgrade pip
# https://stackoverflow.com/questions/62301268/whenever-i-try-to-install-torch-it-displays-killed
# Mitigate "Killed" by adding "--no-cache-dir"
sudo wget https://bootstrap.pypa.io/get-pip.py --output-document get-pip.py && sudo python get-pip.py && sudo rm get-pip.py
sudo pip install --upgrade pip
sudo pip3 install --user -r ../notebooks/requirements.txt --no-cache-dir
sudo pip install jupyterlab
sudo curl -fsSL https://deb.nodesource.com/setup_19.x | sudo bash -
sudo apt-get install -y nodejs
sudo dockerd &
set +e
EXIT_CODE_DOCKER_PS=""
while [ "$EXIT_CODE_DOCKER_PS" -ne "0" ]; do
    docker ps
    EXIT_CODE_DOCKER_PS=$?
    sleep 1;
done
set -e
cd ../app
# ./run.sh
