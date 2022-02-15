# get-cpcert

Console utility to convert cryptopro4 and cryptopro5 certificate (gost-2001, gost-2012) into pem file for openssl 1.1.1

Tested on alpine 3.15 for docker

## how-to

1. `docker-compose up`
2. `docker exec -it get-cpcert.alpine sh`
3. `./build.sh`
4. `./build/get-cpcert folder.000 [password] > certificate.pem`
