#!/bin/bash -eu
cd /src/cryptofuzz && ./cryptofuzz -dict=cryptofuzz-dict.txt CORPUS -print_pcs=1 |& tee -a log
