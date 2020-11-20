#!/bin/sh -e

cat /etc/prometheus/prometheus.yml > /tmp/prometheus.yml
cat /etc/prometheus/weave-cortex.yml | \
    sed "s@#password: <token>#@password: '$WEAVE_TOKEN'@g" > /tmp/weave-cortex.yml

mv /tmp/prometheus.yml /etc/prometheus/prometheus.yml
mv /tmp/weave-cortex.yml /etc/prometheus/weave-cortex.yml

set -- /bin/prometheus "$@"

exec "$@"

