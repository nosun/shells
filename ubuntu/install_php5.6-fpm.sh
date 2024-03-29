#!/usr/bin/env bash

sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update && apt-get upgrade -y
sudo apt-get install php5.6 php5.6-cgi php5.6-curl php5.6-enchant php5.6-gmp php5.6-intl php5.6-mbstring php5.6-odbc php5.6-xml php5.6-zip php5.6-bcmath php5.6-cli php5.6-fpm php5.6-imap php5.6-json php5.6-mcrypt php5.6-opcache php5.6-snmp php5.6-xmlrpc php5.6-bz2 php5.6-common php5.6-dev php5.6-gd php5.6-mysql php5.6-readline php5.6-tidy php5.6-xsl -y
sudo php --version
