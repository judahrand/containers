#!/bin/sh
set -e

echo "Using '$ZIGBEE2MQTT_DATA' as data directory"

if [ ! -f "$ZIGBEE2MQTT_DATA/configuration.yaml" ]; then
    echo "Creating configuration file..."
    cp /configuration.example.yaml "$ZIGBEE2MQTT_DATA/configuration.yaml"
fi

exec zigbee2mqtt "$@"
