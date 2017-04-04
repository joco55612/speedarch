#!/bin/bash

# by web interface create a account and login
# click on top fork https://github.com/joco55612/speedarch

USERNAME="joco55612"

YOUR_REPOSITORY="https://github.com/$USERNAME/speedarch.git"
YOUR_RAW="https://raw.githubusercontent.com/$USERNAME/speedarch/master"

git config --global user.email "joco55612@gmail.com"
git config --global user.name "joco55612"

cd /tmp/
git clone $YOUR_REPOSITORY /tmp/speedarch
mv speedarch/.git .
rm -rf speedarch
cp -r /srv/http/speedarch /tmp/
mv .git speedarch/

cd speedarch
IP="$(ip addr show |grep "inet " |grep -v 127.0.0. |head -1|cut -d" " -f6|cut -d/ -f1)"
YOUR_RAW=${YOUR_RAW//\//\\/}
find . -type f -exec sed -i -e "s/http:\/\/$IP\/speedarch/$YOUR_RAW/g" {} \;

cd /tmp
rm -rf speedarch/speedarch.tar.gz
tar -zcvf speedarch.tar.gz speedarch/
mv speedarch.tar.gz speedarch/speedarch.tar.gz

cd speedarch
git add .
echo "Your commit message" && read MESSAGE
git commit -m "$MESSAGE"
git push --set-upstream origin master
rm -rf /tmp/speedarch
