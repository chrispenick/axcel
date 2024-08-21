#!/bin/bash

# Function to process each .sh file
process_file() {
    local script="$1"
    sed 's/\r$//' "$script" > "${script}.tmp" && mv "${script}.tmp" "$script"
    echo "Processed: $script"
}

# Export the function so it can be used by find
export -f process_file

# Recursively find all .sh files and process them
find . -type f -name "*.sh" -exec bash -c 'process_file "$0"' {} \;
