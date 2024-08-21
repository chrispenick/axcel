#!/bin/bash

# Function to process each .sh file
process_file() {
    local script="$1"
    local cleaned_script="${script%.sh}_cleaned.sh"
    sed 's/\r$//' "$script" > "$cleaned_script"
    echo "Processed: $script -> $cleaned_script"
}

# Export the function so it can be used by find
export -f process_file

# Recursively find all .sh files and process them
find . -type f -name "*.sh" -exec bash -c 'process_file "$0"' {} \;
