#!/bin/bash

# install docker
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get -y update 
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get -y update 
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://f7410aab.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

apt install -y expect


# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


# 部署服务
git clone https://code.aliyun.com/me19/laradock.git
wget http://172.17.56.144/web.tar.gz
wget http://172.17.56.144/nginx.tar.gz
sudo curl -L "http://172.17.56.144/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

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
