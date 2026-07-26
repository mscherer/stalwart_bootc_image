#!/bin/bash

# get hostname from config
# { echo -e "GET /1.0/meta-data/hostname HTTP/1.0\r\n\r" >&3; cat <&3 ; } 3<> /dev/tcp/169.254.169.254/80  | tail -1

# since OVH doesn't let the hostname change after installation, I need a workaround
if [ -f /etc/custom_hostname ]; then
	export HOSTNAME=$(cat /etc/custom_hostname)
else
	export HOSTNAME=$(curl http://169.254.169.254/1.0/meta-data/hostname)
fi;

DOMAIN="${HOSTNAME#*.}"
hostnamectl hostname $HOSTNAME

# configure Caddy
cat > /etc/caddy/Caddyfile <<EOF
# configured by set_hostname.service
$HOSTNAME {
	reverse_proxy :8080
}

$DOMAIN {
	# beware uri already use /
	# use 307, so POST do not become a GET
	# this break jmap in a hard to debug way
	redir https://$HOSTNAME{uri} 307
}
EOF
