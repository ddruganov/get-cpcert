#!/bin/sh

apk add \
    git \
    alpine-sdk \
    cmake \
    openssl-dev \
    libssl1.1

cd /opt
git clone --branch=openssl_1_1_1 https://github.com/gost-engine/engine.git gost-engine
cd gost-engine
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DOPENSSL_ROOT_DIR=/usr/ssl -DOPENSSL_LIBRARIES=/usr/ssl/lib -DOPENSSL_ENGINES_DIR=/usr/ssl/lib/engines-3 ..
cmake --build . --config Release
cmake --build . --target install --config Release
sed -i '1s;^;openssl_conf = openssl_def\n;' /etc/ssl1.1/openssl.cnf
cat openssl.conf >>/etc/ssl1.1/openssl.cnf
