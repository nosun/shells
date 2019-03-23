#!/usr/bin/env bash

sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update && apt-get upgrade -y
apt-get install php5.6 php5.6-fpm php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml -y
