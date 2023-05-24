#!/bin/bash
/sbin/ip route add 10.0.0.0/8 via 172.16.123.142

/usr/sbin/named -g -c /etc/bind/named.conf -u bind