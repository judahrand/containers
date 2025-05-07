# syntax=docker/dockerfile:1

FROM docker.io/library/alpine:3.21
ARG VERSION
USER root
RUN \
    apk add --no-cache \
        bash \
        ca-certificates \
        catatonit \
        net-snmp-libs \
        nut=="${VERSION}" \
    && rm -rf /tmp/*
COPY . /
USER nobody:nogroup
ENTRYPOINT ["/usr/bin/catatonit", "--", "/entrypoint.sh"]
