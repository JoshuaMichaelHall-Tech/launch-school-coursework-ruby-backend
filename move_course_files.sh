#!/bin/bash

# Script to move course files to their respective resource directories
# Usage: ./move_course_files.sh

# Function to move a file to its course directory
move_file() {
  # Extract course prefix (e.g., "js210" from "js210_glossary.md")
  course_prefix=$(echo "$1" | grep -o "^[a-z]\+[0-9]\+\(_[0-9]\+\)*")
  
  if [ -z "$course_prefix" ]; then
    echo "Warning: Could not extract course prefix from $1, skipping"
    return
  fi
  
  # Convert py100_101 style to py100-101 style for directory names if needed
  dir_prefix=$(echo "$course_prefix" | sed 's/_/-/g')
  
  # Determine the course track based on prefix
  if [[ $dir_prefix == js* ]]; then
    track="coursework_js"
    course_dir="${track}/${dir_prefix}"
  elif [[ $dir_prefix == py* ]]; then
    track="coursework_python"
    course_dir="${track}/${dir_prefix}"
  elif [[ $dir_prefix == rb* ]]; then
    track="coursework_ruby"
    course_dir="${track}/${dir_prefix}"
  elif [[ $dir_prefix == ls* ]]; then
    track="coursework_general"
    course_dir="${track}/${dir_prefix}"
  elif [[ $dir_prefix == ts* ]]; then
    track="coursework_ts"
    course_dir="${track}/${dir_prefix}"
  else
    echo "Warning: Unknown course track for $1, skipping"
    return
  fi
  
  # Create resources directory if it doesn't exist
  resources_dir="${course_dir}/resources"
  if [ ! -d "$resources_dir" ]; then
    echo "Creating directory: $resources_dir"
    mkdir -p "$resources_dir"
  fi
  
  # Extract filename without course prefix
  filename=$(echo "$1" | sed "s/^${course_prefix}_//")
  
  # Move the file
  echo "Moving $1 to $resources_dir/$filename"
  mv "$1" "$resources_dir/$filename"
}

# Process all course files in the root directory
for file in *_glossary.md *_reference_sheet.md *_study_guide.md; do
  # Skip if no matching files
  [ -e "$file" ] || continue
  
  move_file "$file"
done

echo "File movement complete!"
