#!/bin/bash

cd /srv/http/
rm -rf speedarch/.git
rm -rf speedarch/speedarch.tar.gz
tar -zcvf speedarch.tar.gz speedarch/
mv speedarch.tar.gz speedarch/speedarch.tar.gz
