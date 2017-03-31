#!/bin/bash

git clone https://github.com/joco55612/speedarch.git /tmp/speedarchGit
git config --global user.email "joco55612@gmail.com"
git config --global user.name "joco55612"

cd /tmp/speedarchGit
git pull
cp /srv/http/speedarch/* /tmp/speedarchGit
ln -s /var/cache/pacman/pkg pkg
IP="$(ip addr show |grep "inet " |grep -v 127.0.0. |head -1|cut -d" " -f6|cut -d/ -f1)"
SERVER="raw.githubusercontent.com/joco55612/speedarch/master"
SERVER=${SERVER//\//\\/}
find . -type f -exec sed -i -e "s/$IP\/speedarch/$SERVER/g" {} \;

git add .
git commit -m "."
git push --set-upstream origin master
