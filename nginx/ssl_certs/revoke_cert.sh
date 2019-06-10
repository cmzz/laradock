#!/bin/bash -e

# 吊销一个签证过的证书

openssl ca -revoke "${1}/${1}.crt"
openssl ca -gencrl -out "./mch_ca/private/ca.crl"