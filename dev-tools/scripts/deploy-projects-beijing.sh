#!/bin/bash

cd /mnt/data

export CONFIG_DIR=./laradock/dev-tools/configs/beijing

# nginx 配置
cp -af ${CONFIG_DIR}/nginx/sites/*.conf laradock/nginx/sites/
cp -af ${CONFIG_DIR}/php-worker/supervisord.d/*.conf laradock/php-worker/supervisord.d/


wget http://dl.bj.lanqq.cn/web.tar.gz
tar xzvf web.tar.gz

# 调整项目配置
cd /mnt/data/laradock
docker-compose up -d nginx php-fpm php-worker