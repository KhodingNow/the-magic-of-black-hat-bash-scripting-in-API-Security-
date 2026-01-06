#!/bin/bash


#!/bin/bash
# parse-apache-log.sh

LOG_FILE="access.log"

analyze_log() {
    echo "Analyzing $LOG_FILE..."
    
    # Parse Apache Combined Log Format
    awk '
    BEGIN {
        total=0; get=0; post=0; errors=0; 
        print "Starting analysis..."
    }
    {
        total++
        ip = $1
        timestamp = $4
        request = $7
        status = $9
        size = $10
        referrer = $11
        user_agent = $12
        
        # Count request methods
        if (request ~ /GET/) get++
        if (request ~ /POST/) post++
        
        # Track errors
        if (status >= 400) errors++
        
        # Track data by IP
        ip_requests[ip]++
        ip_bytes[ip] += size
        
        # Track by hour
        split(timestamp, t, ":")
        hour = t[2]
        hourly[hour]++
    }
    END {
        print "\n=== Analysis Results ==="
        print "Total requests:", total
        print "GET requests:", get, "(" get/total*100 "%)"
        print "POST requests:", post, "(" post/total*100 "%)"
        print "Error responses:", errors, "(" errors/total*100 "%)"
        
        print "\n=== Top 3 IPs ==="
        for (ip in ip_requests) {
            print ip ": " ip_requests[ip] " requests, " ip_bytes[ip] " bytes"
        }
    }' "$LOG_FILE"
}

analyze_log
