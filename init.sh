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

# 部署服务
wget http://172.17.56.144/web.tar.gz
tar xzvf web.tar.gz

cd laradock/
sh ./login_aliyun_docker.sh

sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_nginx:20200215
sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-fpm:20200215
sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-worker:20200215
sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_workspace:20200215

docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_nginx:20200215 laradock_nginx:latest
docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-fpm:20200215 laradock_php-fpm:latest
docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-worker:20200215 laradock_php-worker:latest
docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_workspace:20200215 laradock_workspace:latest