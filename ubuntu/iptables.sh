#!/usr/bin/env bash

SHELLPATH=`pwd`


rm /etc/squid/squid.conf
sudo cp ${SHELLPATH}"/etc/squid.conf" /etc/squid/
sudo cp ${SHELLPATH}"/etc/iptables.up.rules" /etc/
sudo iptables-restore < /etc/iptables.up.rules
sudo iptables-save < /etc/iptables/rules.v4

