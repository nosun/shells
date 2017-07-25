#!/usr/bin/env bash

# Init server install some base tools
# git, zsh, iptables-persistent, git-core
sudo apt-get update && apt-get upgrade -y

# This will install the full Ubuntu desktop environment,
# without office packages

## 确认环节要注意 ##
# 在安装过程中，会提示 "/etc/init/tty1.conf" 是否要使用新的版本，选择 yes

sudo apt-get install --no-install-recommends ubuntu-desktop gnome-panel \
gnome-settings-daemon metacity nautilus gnome-terminal xterm -y
# Install vnc server for testing and check error, not required
sudo apt-get install vnc4server -y

## 修改文件 ##
# start vnc use command : vncserver
# 首次使用此命令会提示输入两遍密码，该密码用于远程连接使用，需要记住
# stop vnc server use command: vncserver -kill :1
# vnc server 启动是的配置文件需要更改。
# ~/.vnc/xstartup
# 在文件底部增加如下几行：@important
# gnome-panel &
# gnome-settings-daemon &
# metacity &
# nautilus &

# Install python env
sudo apt-get -y install python-pip -y
sudo pip install --upgrade pip
sudo apt-get install python-mysqldb -y
sudo pip install boto lxml bs4 selenium pyvirtualdisplay requests

# Install chrome browser
cd /opt
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get update
sudo apt-get install libgconf2-4 libnss3-1d libxss1
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f -y


## 修改文件 ##
# @important chrome 不能使用 root 用户命令的问题，需要修改配置
# /opt/google/chrome/google-chrome
# 底部启动的地方： 在末尾增加参数 --no-sandbox, 大致是这样的：
#
#  if [[ -n "$CHROME_USER_DATA_DIR" ]]; then
#  # Note: exec -a below is a bashism.
#  exec -a "$0" "$HERE/chrome"  \
#    --user-data-dir="$CHROME_USER_DATA_DIR" "$@" --no-sandbox
#  else
#    exec -a "$0" "$HERE/chrome"  "$@" --no-sandbox
#  fi


# Install chrome driver
# https://chromedriver.storage.googleapis.com 下载最新版本

cd /opt
wget https://chromedriver.storage.googleapis.com/2.30/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
mv chromedriver /opt/google/chrome/

# Install seo-client
sudo mkdir -p /srv/work
sudo git clone https://github.com/Mingdabeta/seo_client /srv/work/seo_client

## 修改配置 ##
# configure client settings
# chrome driver path
# mysql config
# dynamo DB config
# facebook account
# queue url etc.


### 执行相关 ###
# 在 vnc 中打开 shell, 手动执行如下命令：
# cd /srv/work/seo_client && nohup python fb_client.py > /srv/work/seo_client/_logs/fb_client.log &