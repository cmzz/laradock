#!/bin/bash

cd ~/data

# 部署服务
# git clone https://code.aliyun.com/me19/laradock.git

wget http://172.17.56.144/nginx.tar.gz

tar xzvf nginx.tar.gz

rm -rf laradock/nginx
mv static_web/nginx laradock/nginx 

cd laradock/
cp env-example-2020-02-15 .env

chmod +x login_aliyun_docker.sh && expect ./login_aliyun_docker.sh

sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_nginx:20200215
sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-fpm:20200215
sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-worker:20200215
sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_workspace:20200215

docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_nginx:20200215 laradock_nginx:latest
docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-fpm:20200215 laradock_php-fpm:latest
docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-worker:20200215 laradock_php-worker:latest
docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_workspace:20200215 laradock_workspace:latest

# 调整项目配置
cd ~/data/laradock
docker-compose up -d nginx php-fpm php-worker

