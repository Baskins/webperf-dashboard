FROM grafana/grafana

EXPOSE 3000

ENV INFLUX_URL=http://influxdb:8086 \
    GF_SECURITY_ADMIN_PASSWORD=secret \
    GF_PANELS_DISABLE_SANITIZE_HTML=true

COPY provisioning/ /etc/grafana/provisioning
COPY grafana.ini /etc/grafana/grafana.ini
COPY entrypoint.sh /entrypoint.sh

USER root
RUN chmod -R 777 /etc/grafana/

ENTRYPOINT [ "/entrypoint.sh" ]
