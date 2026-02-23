#!/bin/bash
# q2_file_manager.sh
# This script provides a menu-driven file and directory manager

while true
do
    echo "-----------------------------"
    echo " FILE & DIRECTORY MANAGER"
    echo "-----------------------------"
    echo "1. Create a file"
    echo "2. Delete a file"
    echo "3. Create a directory"
    echo "4. Delete a directory"
    echo "5. List files and directories"
    echo "6. Exit"
    echo "-----------------------------"
    read -p "Enter your choice (1-6): " choice

    case $choice in
        1)
            read -p "Enter file name to create: " filename
            touch "$filename"
            echo "File '$filename' created successfully."
            ;;

        2)
            read -p "Enter file name to delete: " filename
            if [ -f "$filename" ]; then
                rm "$filename"
                echo "File '$filename' deleted successfully."
            else
                echo "File does not exist."
            fi
            ;;

        3)
            read -p "Enter directory name to create: " dirname
            mkdir "$dirname"
            echo "Directory '$dirname' created successfully."
            ;;

        4)
            read -p "Enter directory name to delete: " dirname
            if [ -d "$dirname" ]; then
                rm -r "$dirname"
                echo "Directory '$dirname' deleted successfully."
            else
                echo "Directory does not exist."
            fi
            ;;

        5)
            echo "Listing files and directories:"
            ls -l
            ;;

        6)
            echo "Exiting program..."
            break
            ;;

        *)
            echo "Invalid choice. Please enter 1-6."
            ;;
    esac

    echo ""
done
