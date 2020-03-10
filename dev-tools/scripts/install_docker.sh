#!/bin/bash

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

# aliyun 镜像
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL http://mirrors.cloud.aliyuncs.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] http://mirrors.cloud.aliyuncs.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"

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

# install docker-compose
# wget wget http://172.17.56.144/docker-compose.tar
# tar xvf docker-compose.tar
# chmod +x docker-compose-Linux-x86_64
# mv docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose

curl -L https://get.daocloud.io/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


# 初始化images
cd /mnt/data/laradock/
cp dev-tools/env-example-2020-02-15 .env

#chmod +x login_aliyun_docker.sh && expect ./login_aliyun_docker.sh
cat aliyun-docker-repo-password | docker login --username=lynx_047@aliyun.com registry.cn-hongkong.aliyuncs.com --password-stdin

sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_nginx:20200215
sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-fpm:20200215
sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-worker:20200215
sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_workspace:20200215

sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_mysql:20200215
sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_redis:20200215
sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_elasticsearch:20200215
sudo docker pull registry.cn-hongkong.aliyuncs.com/cmzz/laradock_mongo:20200215

docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_nginx:20200215 laradock_nginx:latest
docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-fpm:20200215 laradock_php-fpm:latest
docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_php-worker:20200215 laradock_php-worker:latest
docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_workspace:20200215 laradock_workspace:latest

docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_mysql:20200215 laradock_mysql:latest
docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_redis:20200215 laradock_redis:latest
docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_elasticsearch:20200215 laradock_elasticsearch:latest
docker tag registry.cn-hongkong.aliyuncs.com/cmzz/laradock_mongo:20200215 laradock_mongo:latest