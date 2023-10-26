#!/bin/bash

# Exit immediately if any command fails
#set -e

# Function to log commands and execute them
run_command() {
    local cmd="$1"
    echo -e "Running: $cmd"
    eval "$cmd"
}

# Add your post-provisioning commands here
# For example:
# run_command "some_command"

# Start Dradis if necessary
run_command "./bin/rails server"
echo "Open dradis on http://dradis-ce.local"
#run_command "dradis-ce"