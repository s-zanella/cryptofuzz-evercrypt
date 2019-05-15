#!/bin/bash -eu
cd $SRC/cryptofuzz

if [ ! -d "MINIMAL" ]; then
  unzip ../evercrypt_libsodium_openssl.zip
fi

./cryptofuzz -dict=cryptofuzz-dict.txt MINIMAL -print_pcs=1 |& tee -a log
