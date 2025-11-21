#!/bin/bash

    if ss -tuln | grep -q ":22 "; then
        echo "$(date): SSH port 22 is OPEN" >> ssh_port.log
    else
        echo "$(date): SSH port 22 is CLOSED" >> ssh_port.log
    fi
