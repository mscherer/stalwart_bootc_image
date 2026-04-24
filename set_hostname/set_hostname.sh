#!/bin/bash

# get hostname from config
# { echo -e "GET /1.0/meta-data/hostname HTTP/1.0\r\n\r" >&3; cat <&3 ; } 3<> /dev/tcp/169.254.169.254/80  | tail -1

# since OVH doesn't let the hostname change after installation, I need a workaround
if [ -f /etc/custom_hostname ]; then
	export HOSTNAME=$(cat /etc/custom_hostname)
else
	export HOSTNAME=$(curl http://169.254.169.254/1.0/meta-data/hostname)
fi;

hostnamectl hostname $HOSTNAME

# configure Caddy
cat > /etc/caddy/Caddyfile <<EOF
# configured by set_hostname.service
$HOSTNAME
reverse_proxy :8080
EOF
