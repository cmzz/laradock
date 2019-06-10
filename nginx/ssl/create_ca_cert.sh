#!/bin/bash -e

# 创建CA根证书
# 非交互式方式创建以下内容:
# 国家名(2个字母的代号)
C="CN"
# 省
ST="Guangdong"
# 市
L="Shenzhen"
# 公司名
O="cmzz"
# 组织或部门名
OU="paycats"
# 服务器FQDN或颁发者名
CN="paycats.cn"
# 邮箱地址
emailAddress="demo.paycats.cn"

mkdir -p ./mch_ca/{private,newcerts,merchants}
touch ./mch_ca/index.txt
[ ! -f ./mch_ca/seria ] && echo 01 > ./mch_ca/serial
[ ! -f ./mch_ca/crlnumber ] && echo 01 > ./mch_ca/crlnumber
[ ! -f ./mch_ca/cacert.pem ] && openssl req -utf8 -new -x509 -days 36500 -newkey rsa:2048 -nodes -keyout ./mch_ca/private/cakey.pem -out ./mch_ca/cacert.pem -subj "/C=${C}/ST=${ST}/L=${L}/O=${O}/OU=${OU}/CN=${CN}/emailAddress=${emailAddress}"
[ ! -f ./mch_ca/private/ca.crl ] && openssl ca -config './conf/openssl.cnf' -crldays 36500 -gencrl -out "./mch_ca/private/ca.crl"