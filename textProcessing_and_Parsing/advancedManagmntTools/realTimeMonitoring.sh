#!/bin/bash

# Simulate watching new entries
tail -f access.log | while read line; do
    status=$(echo "$line" | awk '{print $9}')
    ip=$(echo "$line" | awk '{print $1}')
    
    if [[ "$status" == "404" ]]; then
        echo "[WARNING] 404 from $ip"
    elif [[ "$status" == "500" ]]; then
        echo "[ALERT] 500 from $ip"
    fi
done
