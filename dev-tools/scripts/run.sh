#!/bin/bash

export DEV_TOOLS=./laradock/dev-tools

sudo apt update
sudo apt -y install git
apt install -y expect

cd /mnt
mkdir data

cd data
git clone https://code.aliyun.com/me19/laradock.git
chmod +x ${DEV_TOOLS}/scripts/*.sh

bash ${DEV_TOOLS}/scripts/install_docker.sh

# 注意更换ip
# wget http://172.17.56.144/nginx.tar.gz
# tar xzvf nginx.tar.gz

# rm -rf laradock/nginx
# mv static_web/nginx laradock/nginx 

# 复制北京服务器组上的项目
bash ${DEV_TOOLS}/scripts/deploy-projects-beijing.sh

# 复制北京服务器组上的项目
bash ${DEV_TOOLS}/scripts/deploy-projects-shenzhen.sh