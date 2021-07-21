![license](https://badgen.net/github/license/flavien-perier/dockerfile-openssl)
[![docker pulls](https://badgen.net/docker/pulls/flavienperier/openssl)](https://hub.docker.com/r/flavienperier/openssl)
[![ci status](https://badgen.net/github/checks/flavien-perier/dockerfile-openssl)](https://github.com/flavien-perier/dockerfile-openssl)

# Dockerfile OpenSSL

Dockerfile for [OpenSSL](https://www.openssl.org/).

Create a certification authority and sign certificates for sub-domains from it.

## Env variables

- C: SSL certificates configuration.
- ST: SSL certificates configuration.
- L: SSL certificates configuration.
- O: SSL certificates configuration.
- OU: SSL certificates configuration.
- DOMAIN: SSL certificates configuration.
- CERTIFICATES: List of sub-domains for which to generate certificates.

## Volumes

- /certificates

## Docker-compose example

```yaml
  openssl:
    image: flavienperier/openssl
    container_name: openssl
    volumes:
      - ./certificates:/certificates
    environment:
      CERTIFICATES: www mail wp admin
```
