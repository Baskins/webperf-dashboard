#!/bin/sh

set -e

echo "INFLUXURL=$INFLUX_URL"

sed -i "s|_INFLUX_URL_|$INFLUX_URL|g" /etc/grafana/provisioning/datasources/datasource.yml

/run.sh
