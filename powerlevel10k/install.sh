#!/bin/sh -xe

cd $(dirname $0)

test -e ~/powerlevel10k || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k &

cp .zshrc ~/.zshrc &
cp .p10k.zsh ~/.p10k.zsh
