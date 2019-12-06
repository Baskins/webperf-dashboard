FROM chronograf:latest

EXPOSE 8888

ENV INFLUX_URL=http://influxdb:8086

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
