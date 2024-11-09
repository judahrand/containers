#!/bin/sh
set -e

echo "Using '$ZIGBEE2MQTT_DATA' as data directory"
exec zigbee2mqtt "$@"
