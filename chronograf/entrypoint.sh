#!/bin/sh

set -e

echo "INFLUXURL=$INFLUX_URL"

chronograf --influxdb-url=$INFLUX_URL
