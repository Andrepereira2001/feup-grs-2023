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

# Add NAT
if [[ -z "${NAT}" ]]; then
    echo "No NAT"
else
    /sbin/iptables-legacy -t nat -F
    /sbin/iptables-legacy -t filter -F
    /sbin/iptables-legacy -t nat -A POSTROUTING -s $NAT -j MASQUERADE
    /sbin/iptables-legacy -P FORWARD DROP
    /sbin/iptables-legacy -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
    /sbin/iptables-legacy -A FORWARD -m state --state NEW -i $INTERN_INTERFACE -j ACCEPT
    if [[ -z "${DMZ}" ]]; then
        echo "No DMZ"
    else
        /sbin/iptables-legacy -A FORWARD -m state --state NEW -d $DMZ -j ACCEPT
    fi
fi

if [[ -z "${VPN}" ]]; then
    echo "No VPN"
else 
    /bin/bash wg-quick up wg0
fi

# /bin/bash -c 'iptables -t filter -A FORWARD -p tcp --dport 80 ! -s 10.0.1.253 -j DROP'
while true ; do /bin/sleep 5m; done
