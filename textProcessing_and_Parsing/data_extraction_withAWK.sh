#!/bin/bash

# Extract specific fields

awk '{print "IP:", $1, "| Path:", $7, "| Status:", $9, "| Size:", $10}' access.log | head -5

# Calculate total bandwith used

awk '{sum += $10} END {print "Total bytes transferred:", sum, "(", sum/1024/1024, "MB)"}' access.log

# Average request size by status code

awk '{count[$9]++; size[$9] += $10} END {for (code in count) print code ": avg size = ", size[code]/count[code], "bytes"}' access.log
