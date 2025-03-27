#!/bin/bash

# Script to move README files from temp directory to their proper locations
# in the repository structure

# Create necessary directories if they don't exist
mkdir -p coursework_general
mkdir -p coursework_ruby
mkdir -p coursework_js
mkdir -p coursework_python
mkdir -p coursework_ts

# Function to move a file to its destination
move_file() {
    local source="$1"
    local dest="$2"
    
    if [ -f "$source" ]; then
        # Create the destination directory if it doesn't exist
        mkdir -p "$(dirname "$dest")"
        
        # Move the file
        mv "$source" "$dest"
        echo "Moved $source to $dest"
    else
        echo "Warning: Source file $source not found"
    fi
}

# General courses
move_file "./temp/ls170-readme.md" "./coursework_general/ls170/README.md"
move_file "./temp/ls180-readme.md" "./coursework_general/ls180/README.md"
move_file "./temp/ls202-readme.md" "./coursework_general/ls202/README.md"
move_file "./temp/ls215-readme.md" "./coursework_general/ls215/README.md"
move_file "./temp/ls220-readme.md" "./coursework_general/ls220/README.md"

# Ruby courses
move_file "./temp/rb101-readme.md" "./coursework_ruby/rb101/README.md"
move_file "./temp/rb110-readme.md" "./coursework_ruby/rb110/README.md"
move_file "./temp/rb120-readme.md" "./coursework_ruby/rb120/README.md"
move_file "./temp/rb130-readme.md" "./coursework_ruby/rb130/README.md"
move_file "./temp/rb175-readme.md" "./coursework_ruby/rb175/README.md"
move_file "./temp/rb185-readme.md" "./coursework_ruby/rb185/README.md"

# JavaScript courses
move_file "./temp/js210-readme.md" "./coursework_js/js210/README.md"
move_file "./temp/js215-readme.md" "./coursework_js/js215/README.md"
move_file "./temp/js225-readme.md" "./coursework_js/js225/README.md"
move_file "./temp/js230-readme.md" "./coursework_js/js230/README.md"

# Python courses
move_file "./temp/py100_101-readme.md" "./coursework_python/py100_101/README.md"
move_file "./temp/py110-readme.md" "./coursework_python/py110/README.md"
move_file "./temp/py120-readme.md" "./coursework_python/py120/README.md"
move_file "./temp/py130-readme.md" "./coursework_python/py130/README.md"
move_file "./temp/py175-readme.md" "./coursework_python/py175/README.md"
move_file "./temp/py185-readme.md" "./coursework_python/py185/README.md"

# TypeScript courses
move_file "./temp/ts240-readme.md" "./coursework_ts/ts240/README.md"

echo "All README files have been moved to their proper locations."
