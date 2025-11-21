#!/bin/bash

# List of 5 websites
SITES=("google.com" "gmail.com" "yahoo.com" "bing.com" "wikipedia.org")

TOTAL_BYTES=0
TOTAL_RTT=0
SITE_COUNT=0

echo "Ping Test Summary"
echo "------------------"

for SITE in "${SITES[@]}"; do
    echo "Pinging: $SITE"

    # Run ping 5 times and capture output
    OUTPUT=$(ping -c 5 $SITE)

    # Extract bytes (from lines like "64 bytes from ...")
    AVG_BYTES=$(echo "$OUTPUT" | awk -F" " '/bytes from/ {sum+=$1} END {print sum/NR}')

    # Extract average RTT from summary section
    AVG_RTT=$(echo "$OUTPUT" | awk -F"/" '/rtt/ {print $5}')

    echo "  Average Bytes      : $AVG_BYTES"
    echo "  Average RTT (ms)   : $AVG_RTT"
    echo ""

    TOTAL_BYTES=$(echo "$TOTAL_BYTES + $AVG_BYTES" | bc)
    TOTAL_RTT=$(echo "$TOTAL_RTT + $AVG_RTT" | bc)
    SITE_COUNT=$((SITE_COUNT + 1))
done

# Final cumulative averages
CUM_AVG_BYTES=$(echo "$TOTAL_BYTES / $SITE_COUNT" | bc)
CUM_AVG_RTT=$(echo "$TOTAL_RTT / $SITE_COUNT" | bc)

echo "=============================="
echo "Cumulative Results (All Sites)"
echo "=============================="
echo "Cumulative Avg Bytes : $CUM_AVG_BYTES"
echo "Cumulative Avg RTT   : $CUM_AVG_RTT ms"
echo "=============================="
