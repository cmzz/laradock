tar zcvf ./static_web/web.tar.gz doukou/ paycats-cp/ paycats-mchapi/ paycats-mchcp/ paycats-web-new/ payment-system/ ssl100-web/

cp -a laradock/nginx ./static_web/

tar zcvf ./static_web/nginx.tar.gz laradock/nginx