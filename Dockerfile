FROM alpine:latest
MAINTAINER Auhil <350764@qq.com>

RUN apk add --update\
    bash\
    tzdata\
    build-base\
    zlib-dev\
    python\
    python-dev\
    py-pip\
    mysql-dev\
    apache2\
    apache2-mod-wsgi\
    memcached\
&&  pip install --no-cache-dir django==1.11.8\
    python-memcached\
    MySQL-python\
&&  mkdir -p /run/apache2/\
&&  ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime\
&&  sed -i 's/#ServerName www.example.com:80/ServerName localhost:80/g' /etc/apache2/httpd.conf
ADD auhil.conf /etc/apache2/conf.d/auhil.conf
