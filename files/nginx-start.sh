#!/bin/bash
set -eo pipefail

# Loop until confd has updated the nginx config
until confd -onetime -node $ETCD -config-file /etc/confd/conf.d/nginx.toml; do
  echo "[nginx] waiting for confd to refresh nginx.conf"
  sleep 5
done

exec /usr/sbin/nginx 
