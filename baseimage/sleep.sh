#!/bin/bash
/sbin/ip route replace default via 10.0.1.254
# /bin/bash -c 'iptables -t filter -A FORWARD -p tcp --dport 80 ! -s 10.0.1.253 -j DROP'
while true ; do /bin/sleep 5m; done
