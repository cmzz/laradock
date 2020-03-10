#!/bin/bash

export DEV_TOOLS=./laradock/dev-tools

sudo apt update
sudo apt -y install git

cd /mnt
mkdir data

cd data
git clone https://code.aliyun.com/me19/laradock.git
chmod +x ${DEV_TOOLS}/scripts/*.sh

bash ${DEV_TOOLS}/scripts/install_docker.sh

# 复制北京服务器组上的项目
bash ${DEV_TOOLS}/scripts/deploy-projects-beijing.sh

# 复制深圳服务器组上的项目
bash ${DEV_TOOLS}/scripts/deploy-projects-shenzhen.sh