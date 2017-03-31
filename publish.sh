#!/bin/bash

# by web interface create a account and login
# click on top fork https://github.com/joco55612/speedarch

YOUR_REPOSITORY = "https://github.com/joco55612/speedarch"
git config --global user.email "joco55612@gmail.com"
git config --global user.name "joco55612"
git clone $YOUR_REPOSITORY.git /tmp/speedarchGit

cd /tmp/speedarchGit
git pull

cp /srv/http/speedarch/* /tmp/speedarchGit
ln -s /var/cache/pacman/pkg pkg
IP="$(ip addr show |grep "inet " |grep -v 127.0.0. |head -1|cut -d" " -f6|cut -d/ -f1)"
YOUR_REPOSITORY=${YOUR_REPOSITORY//\//\\/}
find . -type f -exec sed -i -e "s/http:\/\/$IP\/speedarch/$YOUR_REPOSITORY\/master/g" {} \;

git add .
git commit -m "."
git push --set-upstream origin master
