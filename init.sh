#!/bin/bash

apt install -y expect

# 部署服务
git clone https://code.aliyun.com/me19/laradock.git

chmod +x  laradock/install_docker.sh
./laradock/install_docker.sh

wget http://172.17.56.144/web.tar.gz
wget http://172.17.56.144/nginx.tar.gz


tar xzvf web.tar.gz
tar xzvf nginx.tar.gz

rm -rf laradock/nginx
mv static_web/nginx laradock/nginx 

cd laradock/
cp env-example-2020-02-15 .env

chmod +x login_aliyun_docker.sh && sh ./login_aliyun_docker.sh

sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_nginx:20200215
sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-fpm:20200215
sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-worker:20200215
sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_workspace:20200215

docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_nginx:20200215 laradock_nginx:latest
docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-fpm:20200215 laradock_php-fpm:latest
docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-worker:20200215 laradock_php-worker:latest
docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_workspace:20200215 laradock_workspace:latest

# 调整项目配置
cd ../

rm -rf doukou/.env && cp doukou/example_net.env doukou/.env
rm -rf paycats-cp/.env && cp paycats-cp/example_net.env paycats-cp/.env
rm -rf paycats-mchapi/.env && cp paycats-mchapi/example_net.env paycats-mchapi/.env
rm -rf paycats-mchcp/.env && cp paycats-mchcp/example_net.env paycats-mchcp/.env
rm -rf paycats-web-new/.env && cp paycats-web-new/example_net.env paycats-web-new/.env
rm -rf payment-system/.env && cp payment-system/example_net.env payment-system/.env
rm -rf ssl100-web/.env && cp ssl100-web/example_net.env ssl100-web/.env

cd ../laradock
docker-compose up -d nginx php-fpm php-worker
