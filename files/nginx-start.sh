#!/bin/bash
set -eo pipefail

# Loop until confd has updated the nginx config
until $CONFD_CMD -onetime -config-file /etc/confd/conf.d/nginx.toml; do
  echo "[nginx] waiting for confd to refresh nginx.conf"
  sleep 5
done

exec /usr/sbin/nginx 
