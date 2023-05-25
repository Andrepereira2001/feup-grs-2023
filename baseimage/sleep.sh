#!/bin/bash

# Add default routes
if [[ -z "${DEFAULT_ROUTE}" ]]; then
    echo "No DEFAULT_ROUTE"
else
    /sbin/ip route replace default via $DEFAULT_ROUTE
fi

# Add routes
if [[ -z "${ROUTES}" ]]; then
    echo "No ROUTES"
else
    arrROUTES=(${ROUTES//;/ })
    for route in "${arrROUTES[@]}"; do
        arrRoute=(${route//:/ })
        /sbin/ip route a ${arrRoute[0]} via ${arrRoute[1]}
    done
fi

if [[ -z "${NAT}" ]]; then
    echo "No NAT"
else
    /sbin/iptables -t nat -F
    /sbin/iptables -t filter -F
    /sbin/iptables -t nat -A POSTROUTING -s $NAT -j MASQUERADE
    /sbin/iptables -P FORWARD DROP
    /sbin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
    /sbin/iptables -A FORWARD -m state --state NEW -i $INTERN_INTERFACE -j ACCEPT
fi

# /bin/bash -c 'iptables -t filter -A FORWARD -p tcp --dport 80 ! -s 10.0.1.253 -j DROP'
while true ; do /bin/sleep 5m; done
