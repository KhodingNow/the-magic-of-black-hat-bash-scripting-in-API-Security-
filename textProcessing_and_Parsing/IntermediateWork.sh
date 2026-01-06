#!/bin/bash
echo "=== Apache Log Analysis Report ==="
echo "Generated: $(date)"
echo ""

echo "Total Requests: $(wc -l < access.log)"
echo "Successful (200): $(grep -c " 200 " access.log)"
echo "Client Errors (4xx): $(grep -c " 4[0-9][0-9] " access.log)"
echo "Server Errors (5xx): $(grep -c " 5[0-9][0-9] " access.log)"
echo ""

echo "Top 5 IP Addresses:"
awk '{print $1}' access.log | sort | uniq -c | sort -rn | head -5
echo ""

echo "Top 5 Requested Paths:"
awk -F'"' '{print $2}' access.log | awk '{print $2}' | sort | uniq -c | sort -rn | head -5
echo ""

echo "Top 5 User Agents:"
awk -F'"' '{print $6}' access.log | sort | uniq -c | sort -rn | head -5
