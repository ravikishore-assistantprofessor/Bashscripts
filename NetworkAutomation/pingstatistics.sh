#!/bin/bash

# 5 websites to ping
sites=("google.com" "netflix.com" "bing.com" "cloudflare.com" "github.com")

echo "Calculating average bytes using ping -c 5 ..."
echo "---------------------------------------------"

total_avg_all=0
count=0

for site in "${sites[@]}"
do
    echo "Pinging $site ..."

    # Run 5 pings at once
    output=$(ping -c 5 "$site" 2>/dev/null)

    # Extract bytes (same for all pings)
    bytes=$(echo "$output" | grep "bytes from" | head -1 | awk '{print $1}')

    # If ping failed, set bytes to zero
    bytes=${bytes:-0}

    # Average bytes for the site = bytes per packet (same each ping)
    avg_bytes=$bytes

    echo "Average bytes for $site = $avg_bytes"

    total_avg_all=$((total_avg_all + avg_bytes))
    count=$((count + 1))
done

# Final cumulative average
cumulative_avg=$((total_avg_all / count))

echo "---------------------------------------------"
echo "CUMULATIVE AVERAGE BYTES (all 5 websites) = $cumulative_avg"
