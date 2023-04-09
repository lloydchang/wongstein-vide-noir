#!/bin/sh -xe

cd $(dirname $0)

./install.sh 2>&1 | tee -a install.log