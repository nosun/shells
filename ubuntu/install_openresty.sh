#!/usr/bin/env bash

OPENRESTY_VER=1.11.2.3

apt-get install libreadline-dev libncurses5-dev libpcre3-dev \
    libssl-dev perl make build-essential curl git -y

cd /usr/local/src

wget https://openresty.org/download/openresty-${OPENRESTY_VER}.tar.gz

tar -zxvf openresty-${OPENRESTY_VER}.tar.gz

cd /usr/local/src/openresty-${OPENRESTY_VER}

./configure --prefix=/usr/local/openresty \
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

make && make install

mkdir -p /run/nginx
mkdir -p /var/log/nginx
mkdir -p /var/cache/openresty/client_temp
chown -R www-data.www-data /var/log/nginx
chown -R www-data.www-data /run/nginx
cp ./etc/init.d/nginx /etc/init.d/
chmod +x /etc/init.d/nginx

cd /etc
git clone https://github.com/nosun/nginx_forbidden nginx
cd nginx
# for test
/etc/init.d/nginx reload

