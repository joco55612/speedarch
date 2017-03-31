#!/bin/bash

# TODO : resolution in 1024x759 and speedarch is hardcode in 1920x1080

sudo pacman -S virtualbox linux-headers --noconfirm
sudo vboxreload

cd
mkdir 'VirtualBox VMs'
cd 'VirtualBox VMs'
git clone https://aur.archlinux.org/virtualbox-ext-oracle.git
cd virtualbox-ext-oracle/
echo "Y" | makepkg -si

# rdesktop-vrdp localhost:5555
