### -------------------- Example Config -------------------- ###
FROM docker.io/library/busybox:latest AS builder

ARG TARGETPLATFORM
ARG VERSION
ARG CHANNEL

RUN wget \
    https://raw.githubusercontent.com/Koenkk/zigbee2mqtt/refs/tags/${VERSION}/data/configuration.example.yaml

### -------------------- Zigbee2MQTT -------------------- ###
FROM docker.io/library/node:22.11.0-alpine3.20

ENV UMASK="0002" \
    TZ="Etc/UTC"

USER root

#hadolint ignore=DL3018,DL3059
RUN \
    apk add --no-cache \
        bash \
        catatonit \
        tzdata \
        jq \
        websocat \
    && npm install -g zigbee2mqtt@${VERSION} --omit=dev \
    && npm cache clean --force

# Copy the run script to the container
COPY ./apps/zigbee2mqtt/entrypoint.sh /entrypoint.sh
COPY --from=builder /configuration.example.yaml /configuration.example.yaml

USER nobody:nogroup
WORKDIR /data
VOLUME ["/data"]
ENV ZIGBEE2MQTT_DATA="/data"

# Start the application using the run.sh script
ENTRYPOINT ["/usr/bin/catatonit", "--", "/entrypoint.sh"]

LABEL org.opencontainers.image.source="https://github.com/Koenkk/zigbee2mqtt"
