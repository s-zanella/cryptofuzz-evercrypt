#!/bin/bash -eu
cd $SRC/cryptofuzz

if [ ! -d "CORPUS" ]; then
  unzip ../cryptofuzz-corpora/all_latest.zip -d CORPUS
fi

./cryptofuzz -dict=cryptofuzz-dict.txt CORPUS -print_pcs=1 |& tee -a log
