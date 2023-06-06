#!/usr/bin/env bash
#

# This script is used to run the docker container
# cp -R /test.localhostaspen /usr/local/aspen-discovery/sites

service cron start;

mkdir -p /usr/local/aspen-discovery/tmp/smarty/compile/

mkdir -p /var/logs/aspen-discovery/test.localhostaspen 

chmod -R /var/logs/

chmod -R a+wr  /usr/local/aspen-discovery/

chown -R aspen /data/aspen-discovery/test.localhostaspen/solr7;

service apache2 start;

su -c "/usr/local/aspen-discovery/sites/test.localhostaspen/test.localhostaspen.sh start" aspen;

crontab /etc/cron.d/cron

exec "$@"
