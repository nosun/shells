#!/usr/bin/env bash

# soft update
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
# locale setting
locale-gen zh_CN.UTF-8

# install software
apt-get install vim -y
apt-get install sysv-rc-conf -y
apt-get install iptables-persistent -y
apt-get install git-core -y
apt-get install zsh -y

# oh my zsh install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"