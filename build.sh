#!/bin/sh

mkdir -p build
gcc -o build/get-cpcert \
    -I/opt/gost-engine src/get-cpcert.c \
    -Llibs/openssl-OpenSSL_1_1_1-stable \
    -lssl \
    -lcrypto \
    -L/opt/gost-engine/build \
    -lgost_core \
    -L. \
    -lgost \
    -lpthread \
    -ldl \
    -Xlinker '-rpath=.' &>/dev/null
echo "done"
