#!/bin/bash

set -e

## config.json example
#
# CRON="0 */10 * * * *"
# URLS="https://reactjs.org,https://vuejs.org,https://angular.io"
#
# {
#   "cron": "0 */10 * * * *",
#   "urls": [
#     { "url": "https://reactjs.org", "options": { "report": true } },
#     { "url": "https://vuejs.org", "options": { "report": true } },
#     { "url": "https://angular.io", "options": { "report": true } }
#   ]
# }

echo "CRON=$CRON"
echo "URLS=$URLS"
IFS=',' read -ra URLS_ARRAY <<< "$URLS"
echo "URLS_ARRAY=$URLS_ARRAY"

FILE="/usr/src/webperf-dashboard-lighthouse/config.json"

URLS_JSON=""
for URL in "${URLS_ARRAY[@]}"
do
  URLS_JSON="$(jo url=$URL options=$(jo report=true)) "$URLS_JSON
done

echo "URLS_JSON=$URLS_JSON"
echo

jo -p cron="$CRON" urls=$(jo -a $URLS_JSON) > $FILE
cat $FILE

npm start
