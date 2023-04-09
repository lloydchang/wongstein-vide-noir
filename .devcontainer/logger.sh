#!/bin/sh -xe

cd $(dirname $0)

mkdir -p ../tmp

./install.sh 2>&1 | tee -a ../tmp/install.log