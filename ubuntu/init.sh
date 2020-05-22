#!/usr/bin/env bash

# soft update
sudo apt-get update -y
DEBIAN_FRONTEND=noninteractive sudo apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
# locale setting
sudo locale-gen zh_CN.UTF-8

# install software
sudo apt-get install vim -y
sudo apt-get install sysv-rc-conf -y
sudo apt-get install iptables-persistent -y
sudo apt-get install git-core -y
sudo apt-get install zsh -y
sudo apt-get install lrzsz -y

# oh my zsh install
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
