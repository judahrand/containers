# syntax=docker/dockerfile:1

FROM docker.io/library/alpine:3.21
ARG TARGETARCH
ARG TARGETARCH=${TARGETARCH/amd64/x86_64}
ARG VERSION

USER root

RUN \
    apk add --no-cache --virtual=.build-deps \
        curl \
        tar \
    && curl -fsSL "https://github.com/Majorfi/immich-stack/releases/download/${VERSION}/immich-stack_Linux_${TARGETARCH}.tar.gz" \
        | tar xzf - -C /usr/bin \
    && apk del --purge .build-deps \
    && rm -rf  /tmp/*

ENTRYPOINT [ "/usr/bin/immich-stack" ]
