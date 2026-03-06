#!/bin/bash

# get hostname from config
# { echo -e "GET /1.0/meta-data/hostname HTTP/1.0\r\n\r" >&3; cat <&3 ; } 3<> /dev/tcp/169.254.169.254/80  | tail -1

export HOSTNAME=$(curl http://169.254.169.254/1.0/meta-data/hostname)

hostnamectl hostname $HOSTNAME

# configure Caddy
echo > /etc/caddy/Caddyfile <<EOF
$HOSTNAME
reverse_proxy :8080
EOF
