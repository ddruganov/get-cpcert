FROM alpine:3.15

RUN set -ex && \
    apk add \
    git \
    alpine-sdk \
    cmake \
    openssl-dev \
    libssl1.1

# openssl gost engine setup
WORKDIR /opt
RUN git clone --branch=openssl_1_1_1 https://github.com/gost-engine/engine.git gost-engine
WORKDIR /opt/gost-engine
RUN mkdir build
WORKDIR /opt/gost-engine/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DOPENSSL_ROOT_DIR=/usr/ssl -DOPENSSL_LIBRARIES=/usr/ssl/lib -DOPENSSL_ENGINES_DIR=/usr/ssl/lib/engines-3 ..
RUN cmake --build . --config Release
RUN cmake --build . --target install --config Release
COPY docker/openssl.conf /opt/openssl_gost.conf
RUN OPENSSL_DIRECTORY="$([[ -d /etc/ssl1.1 ]] && echo '/etc/ssl1.1' || echo '/etc/ssl')" && \
    sed -i '1s;^;openssl_conf = openssl_def\n;' "$OPENSSL_DIRECTORY/openssl.cnf" && \
    cat /opt/openssl_gost.conf >> "$OPENSSL_DIRECTORY/openssl.cnf"

WORKDIR /app

CMD ["tail", "-f", "/dev/null"]
