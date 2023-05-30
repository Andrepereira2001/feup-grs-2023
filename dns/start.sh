#!/bin/bash
/sbin/ip route replace default via 172.16.123.142

/usr/sbin/named -g -c /etc/bind/named.conf -u bind