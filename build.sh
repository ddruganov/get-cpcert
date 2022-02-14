#!/bin/sh

gcc -o cert-convert \
  -Igost-engine cert-convert.c \
  -Llibs/openssl-OpenSSL_1_1_1-stable \
  -lssl \
  -lcrypto \
  -Lgost-engine/build \
  -lgost_core \
  -L. \
  -lgost \
  -lpthread \
  -ldl \
  -Xlinker '-rpath=.'
