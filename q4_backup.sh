#!/bin/bash
# q4_backup.sh
# This script creates a compressed backup of a given directory
# Backup file will include timestamp for uniqueness

echo "----------- AUTOMATED BACKUP SCRIPT -----------"

# Ask user for source directory
read -p "Enter the full path of the directory to backup: " source_dir

# Check if source exists
if [ ! -d "$source_dir" ]; then
    echo "Error: Source directory does not exist!"
    exit 1
fi

# Ask user for destination directory
read -p "Enter the destination directory where backup will be stored: " dest_dir

# Check if destination exists
if [ ! -d "$dest_dir" ]; then
    echo "Destination directory does not exist. Creating it..."
    mkdir -p "$dest_dir"
fi

# Generate timestamp
timestamp=$(date +"%Y%m%d_%H%M%S")

# Extract folder name from source path
folder_name=$(basename "$source_dir")

# Create backup filename
backup_file="$dest_dir/${folder_name}_backup_$timestamp.tar.gz"

# Create compressed backup
tar -czf "$backup_file" "$source_dir"

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Backup created successfully!"
    echo "Backup file: $backup_file"
else
    echo "Backup failed!"
fi

echo "-----------------------------------------------"
