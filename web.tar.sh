rm -rf doukou/example_net.env
rm -rf paycats-cp/example_net.env
rm -rf paycats-mchapi/example_net.env
rm -rf paycats-mchcp/example_net.env
rm -rf paycats-web-new/example_net.env
rm -rf payment-system/example_net.env
rm -rf ssl100-web/example_net.env

rm -rf doukou/storage/logs/*.log
rm -rf paycats-cp/storage/logs/*.log
rm -rf paycats-mchapi/storage/logs/*.log
rm -rf paycats-mchcp/storage/logs/*.log
rm -rf paycats-web-new/storage/logs/*.log
rm -rf payment-system/storage/logs/*.log
rm -rf ssl100-web/storage/logs/*.log
rm -rf old_web/storage/logs/*.log

tar zcvf ./static_web/web.tar.gz doukou/ paycats-cp/ paycats-mchapi/ paycats-mchcp/ paycats-web-new/ payment-system/ ssl100-web/ old_web/

cp -a laradock/nginx ./static_web/

# 打包 nginx 的配置
tar zcvf ./static_web/nginx.tar.gz ./static_web/nginx/
