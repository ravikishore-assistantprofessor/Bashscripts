#!/bin/bash
echo "1. Create a File"
echo "2. Delete a File"
echo "3. Move a Directory"
echo "=========================="
read -p "Enter your choice: " choice
case $choice in

    1)
        read -p "Enter the filename to create: " fname
        touch "$fname"
        echo "File created."
        ;;

    2)
        read -p "Enter the filename to delete: " fname
        if [ -f "$fname" ]; then
            rm "$fname"
            echo "File deleted."
        else
            echo "File not found."
        fi
        ;;

    3)
        read -p "Enter the directory to move: " src
         read -p "Enter the destination directory: " dest 
        if [ -d "$src" ]; then
            mv "$src" "$dest"
           echo "Directory moved."
        else
            echo "No directory found."
        fi
        ;;

    *)
        echo "Invalid option"
        ;;
esac

