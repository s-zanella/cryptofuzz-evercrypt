#!/bin/bash -eu
cd /src/cryptofuzz

if [ ! -d "CORPUS" ]; then
  mkdir corpus && ./generate_corpus
fi

./cryptofuzz -dict=cryptofuzz-dict.txt CORPUS -print_pcs=1 |& tee -a log
