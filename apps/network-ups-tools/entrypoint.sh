#!/usr/bin/env bash
set -e

/usr/sbin/upsdrvctl -u root start
exec /usr/sbin/upsd -u root -D
