#!/bin/sh -x

test -e ~/powerlevel10k || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh