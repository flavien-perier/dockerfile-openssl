FROM alpine

LABEL maintainer="Flavien PERIER <perier@flavien.io>"
LABEL version="1.0"
LABEL description="OpenSSL"

ENV C FR
ENV ST Limoges
ENV L Limoges
ENV O Flavien
ENV OU local
ENV DOMAIN local

ENV CERTIFICATES test

RUN apk add --update --no-cache openssl

WORKDIR /root
COPY genRsa.sh genRsa.sh
RUN chmod 750 genRsa.sh

VOLUME /root/certificates

CMD ./genRsa.sh
