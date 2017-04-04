#!/bin/bash

SERVER="https://raw.githubusercontent.com/joco55612/speedarch/master"

sudo pacman -S gvim --noconfirm --needed

cd
curl -O $SERVER/dotfiles/vimrc
mv vimrc .vimrc
source .vimrc
sudo cp .vimrc /root/.vimrc
sudo source /root/.vimrc

echo "export EDITOR=/usr/bin/vim" >> .bashrc
echo "export EDITOR=/usr/bin/vim" | sudo tee --append  /root/.bashrc
