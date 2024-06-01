FROM alpine

LABEL org.opencontainers.image.title="OpenSSL" \
      org.opencontainers.image.description="OpenSSL" \
      org.opencontainers.image.version="1.0.0" \
      org.opencontainers.image.vendor="flavien.io" \
      org.opencontainers.image.maintainer="Flavien PERIER <perier@flavien.io>" \
      org.opencontainers.image.url="https://github.com/flavien-perier/dockerfile-openssl" \
      org.opencontainers.image.source="https://github.com/flavien-perier/dockerfile-openssl" \
      org.opencontainers.image.licenses="MIT"

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

VOLUME /certificates

RUN apk add --update --no-cache openssl

COPY --chown=root:root --chmod=500 start.sh /root/start.sh

CMD /root/start.sh
