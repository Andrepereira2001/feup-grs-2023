#!/bin/bash
if [[ -z "${DEFAULT_ROUTE}" ]]; then
    echo "No default route"
else
    /sbin/ip route replace default via $DEFAULT_ROUTE
fi
nginx -g "daemon off;"