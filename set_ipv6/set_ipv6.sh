#!/bin/bash

# note that networkctl do not like " and jq add them

export CURL="curl -s http://169.254.169.254/openstack/latest/network_data.json"
export IP=$($CURL | jq '.networks.[] | select(.type == "ipv6") | .ip_address' | tr -d '"')
export GATEWAY=$($CURL | jq '.networks.[] | select(.type == "ipv6") | .routes.[] | select(.network == "::") | .gateway ' | tr -d '"')
export MAC_ADDR=$($CURL | jq '.links.[].ethernet_mac_address' | tr -d '"')

echo "
[Match] 
Type=ether
MACAddress=$MAC_ADDR

[Network]
DHCP=ipv4
Address=$IP/64
Gateway=$GATEWAY" > /run/systemd/network/00_ipv6.network

networkctl reload
