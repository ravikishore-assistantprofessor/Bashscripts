#!/bin/bash

while true
do
    echo "=============================="
    echo "   IP ADDRESS CLASS MENU"
    echo "=============================="
    echo "1. Class A"
    echo "2. Class B"
    echo "3. Class C"
    echo "4. Class D"
    echo "5. Class E"
    echo "6. Exit"
    echo "=============================="

    read -p "Enter your choice: " ch

    case $ch in
        1)
            echo "Class A IP Range: 0.0.0.0 to 127.255.255.255"
            echo "Default Subnet Mask: 255.0.0.0"
            ;;
        2)
            echo "Class B IP Range: 128.0.0.0 to 191.255.255.255"
            echo "Default Subnet Mask: 255.255.0.0"
            ;;
        3)
            echo "Class C IP Range: 192.0.0.0 to 223.255.255.255"
            echo "Default Subnet Mask: 255.255.255.0"
            ;;
        4)
            echo "Class D IP Range: 224.0.0.0 to 239.255.255.255"
            echo "Used for Multicast"
            ;;
        5)
            echo "Class E IP Range: 240.0.0.0 to 255.255.255.255"
            echo "Reserved for Experimental Use"
            ;;
        6)
            echo "Exiting the program..."
            exit 0
            ;;
        *)
            echo "Invalid option! Please choose 1–6."
            ;;
    esac

done
