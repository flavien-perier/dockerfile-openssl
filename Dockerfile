FROM alpine

LABEL maintainer="Flavien PERIER <perier@flavien.io>" \
      version="1.0.0" \
      description="OpenSSL"

ENV C="FR" \
    ST="Limoges" \
    L="Limoges" \
    O="Flavien" \
    OU="local" \
    DOMAIN="local" \
    CERTIFICATES="test" \
    UID="1000" \
    GID="1000" \
    CHMOD="400"

WORKDIR /root
VOLUME /root/certificates

COPY --chown=root:root genRsa.sh genRsa.sh

RUN apk add --update --no-cache openssl && \
    chmod 750 genRsa.sh

CMD ./genRsa.sh
