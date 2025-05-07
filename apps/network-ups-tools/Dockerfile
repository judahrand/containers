# syntax=docker/dockerfile:1

FROM docker.io/library/alpine:3.21
ARG VERSION
USER root
RUN \
    mkdir -p /var/run/nut \
    && apk add --no-cache \
        bash \
        ca-certificates \
        catatonit \
        net-snmp-libs \
        nut=="${VERSION}" \
    && rm -rf /tmp/*
COPY . /
ENTRYPOINT ["/usr/bin/catatonit", "--", "/entrypoint.sh"]
