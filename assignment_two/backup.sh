#!/bin/bash

# Check if correct number of arguments provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Assign source and destination directories from command line arguments
source_dir=$1
dest_dir=$2

# Check if source directory exists
if [ ! -d "$source_dir" ]; then
    echo "Source directory does not exist."
    exit 1
fi

# Generate timestamp
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Create backup tar archive
backup_file="$dest_dir/backup_$timestamp.tar.gz"
tar -czf "$backup_file" -C "$(dirname "$source_dir")" "$(basename "$source_dir")"

if [ $? -eq 0 ]; then
    echo "Backup created successfully: $backup_file"
else
    echo "Error creating backup."
fi
