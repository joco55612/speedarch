#!/bin/bash

# by web interface create a account and login
# click on top fork https://github.com/joco55612/speedarch

USERNAME="joco55612"

YOUR_REPOSITORY="https://github.com/$USERNAME/speedarch.git"
YOUR_RAW="https://raw.githubusercontent.com/$USERNAME/speedarch/master"

git config --global user.email "joco55612@gmail.com"
git config --global user.name "joco55612"
git clone $YOUR_REPOSITORY /tmp/speedarchGit

cd /tmp/speedarchGit
git pull

cp /srv/http/speedarch/* /tmp/speedarchGit
ln -s /var/cache/pacman/pkg pkg
IP="$(ip addr show |grep "inet " |grep -v 127.0.0. |head -1|cut -d" " -f6|cut -d/ -f1)"
YOUR_RAW=${YOUR_RAW//\//\\/}
find . -type f -exec sed -i -e "s/http:\/\/$IP\/speedarch/$YOUR_RAW/g" {} \;

git add .
git commit -m "."
git push --set-upstream origin master
