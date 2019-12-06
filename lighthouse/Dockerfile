FROM felicegeracitano/webperf-dashboard-lighthouse:1.1.1

RUN apt-get install jo

ENV CRON="0 */10 * * * *" \
    URLS="https://reactjs.org,https://vuejs.org,https://angular.io" \
    HOST=influxdb

COPY entrypoint.sh /entrypoint.sh

EXPOSE 3000

ENTRYPOINT [ "/entrypoint.sh" ]
