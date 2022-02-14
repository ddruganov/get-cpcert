# get-cpcert

Console utility to convert cryptopro4 and cryptopro5 certificate (gost-2001, gost-2012) into pem file for openssl 1.1.1

Tested on alpine 3.15 for docker

## prepare
`$ ./prepare.sh` downloads and installs gost engine for openssl1.1.1

## build

`$ ./build.sh` outputs `cert-convert`

## usage
`$ cert-convert folder.000 password > certificate.pem`
