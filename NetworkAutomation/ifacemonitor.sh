#!/bin/bash

LOGFILE="iface.log"

echo "Starting interface monitor... Logging every 10 seconds."
echo "Saving output to $LOGFILE"
echo "---------------------------------------------" >> "$LOGFILE"

while true
do
    echo "----- $(date) -----" >> "$LOGFILE"

    # Display only interfaces and IPs
    ip -o addr show | awk '
        {
            iface=$2;
            ip=$4;
            print iface, ip;
        }
    ' >> "$LOGFILE"

    echo "" >> "$LOGFILE"
    sleep 10
done
