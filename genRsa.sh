#!/bin/sh

mkdir certificates 2>/dev/null
mkdir certificates/root 2>/dev/null

if [ ! -f certificates/root/root.key ]
then
    openssl genrsa -out certificates/root/root.key 4096
    openssl req -x509 -new -nodes -sha256 -days 365 -key certificates/root/root.key -out certificates/root/root.pem -subj "/C=$C/ST=$ST/L=$L/OU=$OU/O=$O/CN=$DOMAIN"
fi

for key in $CERTIFICATES
do
    mkdir certificates/$key 2>/dev/null
    
    openssl genrsa -out certificates/$key/$key.key 4096
    openssl req -sha256 -new -key certificates/$key/$key.key -out certificates/$key/$key.csr -subj "/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=$key.$DOMAIN"
    openssl x509 -req -sha256 -days 7 -in certificates/$key/$key.csr -CA certificates/root/root.pem -CAkey certificates/root/root.key -CAcreateserial -out certificates/$key/$key.cert 
done
