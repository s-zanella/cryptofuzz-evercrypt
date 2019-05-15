#!/bin/bash -eu

export SANITIZER="address,undefined"
export SANITIZER_FLAGS="$SANITIZER_FLAGS_address $SANITIZER_FLAGS_undefined"

#export COVERAGE_FLAGS="$COVERAGE_FLAGS $COVERAGE_FLAGS_coverage"

export CFLAGS="$CFLAGS $SANITIZER_FLAGS $COVERAGE_FLAGS"
export CXXFLAGS="$CFLAGS $CXXFLAGS_EXTRA"
export CXXFLAGS="$CXXFLAGS -I $SRC/cryptofuzz/fuzzing-headers/include"
export CXXFLAGS="$CXXFLAGS -DCRYPTOFUZZ_EVERCRYPT -DCRYPTOFUZZ_LIBSODIUM -DCRYPTOFUZZ_OPENSSL"

export EVERCRYPT_A_PATH="$SRC/evercrypt/dist/generic/libevercrypt.a"
export KREMLIN_A_PATH="$SRC/evercrypt/dist/kremlin/kremlib/dist/minimal/*.o"
export EVERCRYPT_INCLUDE_PATH="$SRC/evercrypt/dist/"
export KREMLIN_INCLUDE_PATH="$SRC/evercrypt/dist/kremlin/include"

export LIBSODIUM_A_PATH="$SRC/libsodium/src/libsodium/.libs/libsodium.a"
export LIBSODIUM_INCLUDE_PATH="$SRC/libsodium/src/libsodium/include"

export OPENSSL_INCLUDE_PATH="$SRC/openssl/include"
export OPENSSL_LIBCRYPTO_A_PATH="$SRC/openssl/libcrypto.a"
