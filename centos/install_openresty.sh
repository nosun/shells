#!/bin/bash

OPENRESTY_VER=1.11.2.3
SHELLPATH=`pwd`

yum install readline-devel pcre-devel openssl-devel gcc -y

cd /usr/local/src

sudo wget https://openresty.org/download/openresty-${OPENRESTY_VER}.tar.gz
sudo tar -zxvf openresty-${OPENRESTY_VER}.tar.gz
cd /usr/local/src/openresty-${OPENRESTY_VER}

sudo ./configure --prefix=/usr/local/openresty \
  --http-log-path=/var/log/openresty/access.log \
  --error-log-path=/var/log/openresty/error.log \
  --http-client-body-temp-path=/var/cache/openresty/client_temp \
  --http-proxy-temp-path=/var/cache/openresty/proxy_temp \
  --http-fastcgi-temp-path=/var/cache/openresty/fastcgi_temp \
  --http-uwsgi-temp-path=/var/cache/openresty/uwsgi_temp \
  --http-scgi-temp-path=/var/cache/openresty/scgi_temp \
  --pid-path=/var/run/openresty.pid \
  --with-http_realip_module \
  --with-http_stub_status_module \
  --with-http_gzip_static_module \
  --with-http_ssl_module \
  --with-cc-opt='-O2 -g' \
  --with-luajit

sudo make && make install

chkconfig nginx on
sudo mkdir -p /var/log/nginx
sudo mkdir -p /var/cache/openresty/client_temp
sudo chown -R nginx.nginx /var/log/nginx
sudo cp ${SHELLPATH}"/etc/init.d/nginx" /etc/init.d/
sudo chmod +x /etc/init.d/nginx

cd /etc
rm -rf nginx
sudo git clone https://github.com/nosun/nginx_forbidden nginx

# for test
sudo /etc/init.d/nginx reload
