#!/bin/bash
if [[ -z "${DEFAULT_ROUTE}" ]]; then
    echo "No default route"
else
    /sbin/ip route replace default via $DEFAULT_ROUTE
fi
# /bin/bash -c 'iptables -t filter -A FORWARD -p tcp --dport 80 ! -s 10.0.1.253 -j DROP'
while true ; do /bin/sleep 5m; done
