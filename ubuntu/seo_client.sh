#!/usr/bin/env bash

# Init server install some base tools
# git, zsh, iptables-persistent, git-core
sudo apt-get update && apt-get upgrade -y

# This will install the full Ubuntu desktop environment,
# without office packages
sudo apt-get install --no-install-recommends ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal -y
# Install vnc server for testing and check error, not required
sudo apt-get install vnc4server

# Install python env
sudo apt-get -y install python-pip -y
sudo pip install --upgrade pip -y
sudo apt-get install python-mysqldb -y
sudo pip install boto lxml bs4 selenium pyvirtualdisplay requests

# Install chrome browser
cd /opt
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get update
sudo apt-get install libgconf2-4 libnss3-1d libxss1
sudo dpkg -i google-chrome-stable_current_i386.deb
sudo apt-get install -f

# Install chrome driver
# https://chromedriver.storage.googleapis.com 下载最新版本
cd /opt
wget https://chromedriver.storage.googleapis.com/2.30/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
mv chromedriver /opt/google/chrome/

# Install seo-client
sudo mkdir -p /srv/work
sudo git clone https://github.com/Mingdabeta/seo_client /srv/work/seo_client

# configure client settings
# chrome driver path
# mysql config
# dynamo DB config
# facebook account
# queue url etc.