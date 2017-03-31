#!/bin/bash

SERVER="/master"

sudo pacman -S gvim --noconfirm --needed

cd
curl -O $SERVER/speedarch/vimrc
mv vimrc .vimrc
source .vimrc
sudo cp .vimrc /root/.vimrc
sudo source /root/.vimrc

echo "export EDITOR=/usr/bin/vim" >> .bashrc
echo "export EDITOR=/usr/bin/vim" | sudo tee --append  /root/.bashrc
