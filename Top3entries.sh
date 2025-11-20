#!/bin/bash

for i in {1..24}
do
    echo "----- $(date) -----"
    ps aux --sort=-%cpu | head -n 4
    echo ""
    sleep 5
done

echo "Done."
