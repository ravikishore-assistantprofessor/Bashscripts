#!/bin/bash

read -p "Enter the output filename: " systemlog

# If empty name given
[[ -z "$systemlog" ]] && echo "Filename cannot be empty!" && exit 1

# Write outputs using redirection
{
    echo "===== CPU INFORMATION ====="
    lscpu
    echo ""

    echo "===== MEMORY INFORMATION ====="
    free -h
    echo ""

    echo "===== DISK USAGE ====="
    df -h
} > "$systemlog"

echo "System information saved to $outfile"

