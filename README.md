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

- /root/certificates

## Docker-compose example

```yaml
  openssl:
    image: flavienperier/openssl
    container_name: openssl
    volumes:
      - ./certificates:/root/certificates
    environment:
      CERTIFICATES: www mail wp admin
```
