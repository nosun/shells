#!/bin/bash

# install dependance
yum install gcc-c++ cmake lua lua-devel.i686

# download lsyncd  from github
cd /usr/local/src && wget https://github.com/axkibe/lsyncd/archive/release-2.2.2.tar.gz
tar -zxvf release-2.2.2.tar.gz
cd lsyncd-release-2.2.2

# make and make install
cmake .
make
make install
