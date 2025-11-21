#!/bin/bash

# 5 websites
sites=("google.com" "yahoo.com" "bing.com" "cloudflare.com" "github.com")

echo "Calculating bytes + response time for each website..."
echo "------------------------------------------------------"

total_bytes_all=0
total_rtt_all=0
count=0

for site in "${sites[@]}"
do
    echo "Pinging $site ..."
    
    # Run 5 pings at once
    output=$(ping -c 5 "$site" 2>/dev/null)

    # Extract bytes (same for all pings)
    bytes=$(echo "$output" | grep "bytes from" | head -1 | awk '{print $1}')
    bytes=${bytes:-0}

    # Extract average RTT (response time) from rtt line
    # Format: rtt min/avg/max/mdev = 14.123/20.345/25.678/1.234 ms
    avg_rtt=$(echo "$output" | grep "rtt" | awk -F'/' '{print $5}' | awk '{print $1}')
    avg_rtt=${avg_rtt:-0}

    echo "Average bytes       for $site = $bytes"
    echo "Average response ms for $site = $avg_rtt"
    echo ""

    total_bytes_all=$((total_bytes_all + bytes))
    total_rtt_all=$(echo "$total_rtt_all + $avg_rtt" | bc)
    count=$((count + 1))
done

# Final cumulative averages
cumulative_avg_bytes=$((total_bytes_all / count))
cumulative_avg_rtt=$(echo "scale=3; $total_rtt_all / $count" | bc)

echo "------------------------------------------------------"
echo "CUMULATIVE AVERAGE BYTES       = $cumulative_avg_bytes"
echo "CUMULATIVE AVERAGE RESPONSE ms = $cumulative_avg_rtt"
