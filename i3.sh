#!/bin/bash

# key map : see config file in this repository

# TODO : grep interface name and modify bar.py

SERVER="https://raw.githubusercontent.com/joco55612/speedarch/master/"

sudo pacman -S xorg-server xorg-xinit xorg-server-utils xorg-apps --noconfirm --needed

sudo lspci | grep -e VGA
sudo pacman -S xf86-video-intel --noconfirm
sudo pacman -S nvidia --noconfirm
sudo pacman -S virtualbox-guest-utils linux-headers --noconfirm

sudo pacman -S libx264-10bit i3-wm alsa-utils git python-pip compton rxvt-unicode --noconfirm --needed
sudo pip install i3pystatus
sudo pip install pyalsaaudio
sudo pip install psutil
sudo pip install netifaces
sudo pip install colour

cd
rm -rf .xinitrc
head -n -6 /etc/X11/xinit/xinitrc >> .xinitrc
echo "exec i3" >> .xinitrc
curl -O $SERVER/Xresources
mv Xresources .Xresources

mkdir .config
cd .config
mkdir i3
cd i3
curl -O $SERVER/config
curl -O $SERVER/bar.py
git clone https://aur.archlinux.org/ttf-font-awesome.git
cd ttf-font-awesome
echo "Y" | makepkg -si
cd
curl -O $SERVER/bash_profile
cat << Instruction
-- reboot --
startx #to test i3
mv bash_profile .bash_profile #auto startx
Instruction
read a
sudo reboot
