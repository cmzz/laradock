#!/bin/bash

sudo apt update
sudo apt -y install git
apt install -y expect

cd ~
mkdir data
cd data

git clone https://code.aliyun.com/me19/laradock.git

chmod +x laradock/*.sh

bash ./laradock/install_docker.sh

bash ./laradock/init.sh
