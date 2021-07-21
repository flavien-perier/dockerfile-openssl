FROM alpine

LABEL maintainer="Flavien PERIER <perier@flavien.io>" \
      version="1.0.0" \
      description="OpenSSL"

ENV C="FR"
ENV ST="Limoges"
ENV L="Limoges"
ENV O="Flavien"
ENV OU="local"
ENV DOMAIN="local"

ENV CERTIFICATES="test"

WORKDIR /root
VOLUME /root/certificates

COPY genRsa.sh genRsa.sh
RUN apk add --update --no-cache openssl && \
    chmod 750 genRsa.sh

CMD ./genRsa.sh
