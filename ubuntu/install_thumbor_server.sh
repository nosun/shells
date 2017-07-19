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

