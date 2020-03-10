sudo docker tag [ImageId] registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_mongo:20200215
sudo docker tag [ImageId] registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_mysql:20200215
sudo docker tag [ImageId] registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_nginx:20200215
sudo docker tag [ImageId] registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_php-fpm:20200215
sudo docker tag [ImageId] registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_redis:20200215
sudo docker tag [ImageId] registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_workspace:20200215
sudo docker tag [ImageId] registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_elasticsearch:20200215
sudo docker tag [ImageId] registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_php-worker:20200215


sudo docker push registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_mongo:20200215
sudo docker push registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_mysql:20200215
sudo docker push registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_nginx:20200215
sudo docker push registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_php-fpm:20200215
sudo docker push registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_redis:20200215
sudo docker push registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_workspace:20200215
sudo docker push registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_elasticsearch:20200215
sudo docker push registry.cn-shenzhen.aliyuncs.com/cmzz/laradock_php-worker:20200215


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