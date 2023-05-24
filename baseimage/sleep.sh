#!/bin/bash
if [[ -z "${DEFAULT_ROUTE}" ]]; then
    echo "No DEFAULT_ROUTE"
else
    /sbin/ip route replace default via $DEFAULT_ROUTE
fi

if [[ -z "${ROUTES}" ]]; then
    echo "No ROUTES"
else
    arrROUTES=(${ROUTES//;/ })
    for route in "${arrROUTES[@]}"; do
        arrRoute=(${route//:/ })
        /sbin/ip route a ${arrRoute[0]} via ${arrRoute[1]}
    done
fi

# /bin/bash -c 'iptables -t filter -A FORWARD -p tcp --dport 80 ! -s 10.0.1.253 -j DROP'
while true ; do /bin/sleep 5m; done
