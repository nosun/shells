#!/bin/bash

# install thumbor
apt-get install libcurl4-openssl-dev -y
apt-get install libjpeg-dev -y
apt-get install python-dev -y
apt-get install python-pip -y
pip install --upgrade pip
pip install thumbor

## install supervisord
pip install supervisor

## install magick

sudo apt-get install libmagickwand-dev -y
sudo apt-get install luarocks -y
sudo luarocks install magick

## cp config file
## 此处需要注意的是版本软件的版本，本版本只适用于当下，如果不是，请比对更新
cp ./etc/supervisor/supervisord.conf /etc/
cp ./etc/thumbor/thumbor.conf /etc/