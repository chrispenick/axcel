#!/bin/bash

# Get the full path of the script itself
SCRIPT_NAME="$(basename "$0")"

# Function to process each .sh file
process_file() {
    local script="$1"
    
    # Skip the script itself
    if [ "$(basename "$script")" == "$SCRIPT_NAME" ]; then
        return
    fi

    # Process the file
    sed 's/\r$//' "$script" > "${script}.tmp" && mv "${script}.tmp" "$script"
    echo "Processed: $script"
}

# Export the function so it can be used by find
export -f process_file
export SCRIPT_NAME

# Recursively find all .sh files and process them, skipping the script itself
find . -type f -name "*.sh" -exec bash -c 'process_file "$0"' {} \;
