#!/usr/bin/env bash

sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update && apt-get upgrade -y
sudo apt-get install php5.6 php5.6-fpm php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml -y
sudo sysv-rc-conf php5.6-fpm  on