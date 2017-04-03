#!/bin/bash

SERVER="https://raw.githubusercontent.com/joco55612/speedarch/master"

# when you edit file in remote repository you must update you tar.gz on remote server: bash save.sh

sudo pacman -S apache --noconfirm --needed
sudo systemctl start httpd
sudo systemctl enable httpd
sudo chmod 777 /srv/http/

cd /srv/http/
curl -O $SERVER/speedarch.tar.gz  ########################
tar xvf speedarch.tar.gz -C ./
mv speedarch.tar.gz speedarch/speedarch.tar.gz

cd speedarch
SERVER="$SERVER"
IP="$(ip addr show |grep "inet " |grep -v 127.0.0. |head -1|cut -d" " -f6|cut -d/ -f1)"
SERVER=${SERVER//\//\\/}
find ./ -type f -exec sed -i -e "s/$SERVER/http:\/\/$IP\/speedarch/g" {} \;
cat speedarch.sh
