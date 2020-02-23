#!/usr/bin/expect

set timeout 1

spawn sudo docker login --username=lynx_047@aliyun.com registry.cn-hongkong.aliyuncs.com
expect "*password:"
send "Dockerhub2020\r"
interact