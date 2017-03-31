#!/bin/bash

SERVER="https://raw.githubusercontent.com/joco55612/speedarch/master/"

sudo pacman -S firefox --noconfirm --needed
source <(curl -s $SERVER/cups.sh)

sudo pacman -S libreoffice inkscape gimp blender atom pcmanfm mpv youtube-dl qbittorrent keepass mc openssh pigz --noconfirm --needed

source <(curl -s $SERVER/atom.sh)
source <(curl -s $SERVER/gvim.sh)
source <(curl -s $SERVER/speedarch.sh)
source <(curl -s $SERVER/virtualbox.sh)
source <(curl -s $SERVER/samba.sh)

echo "-- reboot --" && read a
reboot
