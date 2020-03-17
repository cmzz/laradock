rm -rf doukou/storage/logs/*.log
rm -rf paycats-cp/storage/logs/*.log
rm -rf paycats-mchapi/storage/logs/*.log
rm -rf paycats-mchcp/storage/logs/*.log
rm -rf paycats-web-new/storage/logs/*.log
rm -rf payment-system/storage/logs/*.log
rm -rf ssl100-web/storage/logs/*.log
rm -rf old_web/storage/logs/*.log


cd /mnt/vdb && tar -g snapshot -zcvf ./static_web/web.tar.gz doukou/ \
    paycats-cp/ \
    paycats-mchapi/ \
    paycats-mchcp/ \
    paycats-web-new/ \
    payment-system/ \
    ssl100-web/ \
    old_web/ \
    tbk-commander
