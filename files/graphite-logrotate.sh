!/bin/bash

CARBON_LOGS="/var/log/carbon-* /var/log/graphite-web"

# gzip log files older than 3 days
find $CARBON_LOGS -type f -mtime +3 -exec gzip -q "{}" \;
# removes log files older than 30 days
find $CARBON_LOGS -type f -ctime +30 -exec rm "{}" \;