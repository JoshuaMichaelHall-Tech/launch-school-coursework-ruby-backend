#!/bin/bash

# Script to place study resources in correct course directories
# Usage: ./study_resource_mover.sh

# Function to copy a file to its destination, removing the course prefix
copy_file() {
  source_file=$1
  course_dir=$2
  file_type=$3
  
  # Extract the base name without course prefix (e.g., "rb100_glossary.md" -> "glossary.md")
  base_name=$(echo "$source_file" | sed -E "s/^rb[0-9]+_//")
  
  # Create destination directory if it doesn't exist
  mkdir -p "$course_dir"
  
  # Copy file to destination
  cp "$source_file" "$course_dir/$base_name"
  
  echo "Copied $source_file to $course_dir/$base_name"
}

# Main script
echo "Moving study resources to appropriate course directories..."

# RB100
course_dir="coursework_ruby/rb100/resources"
copy_file "rb100_glossary.md" "$course_dir" "glossary"
copy_file "rb100_reference_sheet.md" "$course_dir" "reference_sheet"
copy_file "rb100_study_guide.md" "$course_dir" "study_guide"

# RB101
course_dir="coursework_ruby/rb101/resources"
copy_file "rb101_glossary.md" "$course_dir" "glossary"
copy_file "rb101_reference_sheet.md" "$course_dir" "reference_sheet"
copy_file "rb101_study_guide.md" "$course_dir" "study_guide"

# RB110
course_dir="coursework_ruby/rb110/resources"
copy_file "rb110_glossary.md" "$course_dir" "glossary"
copy_file "rb110_reference_sheet.md" "$course_dir" "reference_sheet"
copy_file "rb110_study_guide.md" "$course_dir" "study_guide"

# RB120
course_dir="coursework_ruby/rb120/resources"
copy_file "rb120_glossary.md" "$course_dir" "glossary"
copy_file "rb120_reference_sheet.md" "$course_dir" "reference_sheet"
copy_file "rb120_study_guide.md" "$course_dir" "study_guide"

# RB130
course_dir="coursework_ruby/rb130/resources"
copy_file "rb130_glossary.md" "$course_dir" "glossary"
copy_file "rb130_reference_sheet.md" "$course_dir" "reference_sheet"
copy_file "rb130_study_guide.md" "$course_dir" "study_guide"

# RB170
course_dir="coursework_ruby/rb170/resources"
copy_file "rb170_glossary.md" "$course_dir" "glossary"
copy_file "rb170_reference_sheet.md" "$course_dir" "reference_sheet"
copy_file "rb170_study_guide.md" "$course_dir" "study_guide"

# RB175
course_dir="coursework_ruby/rb175/resources"
copy_file "rb175_glossary.md" "$course_dir" "glossary"
copy_file "rb175_reference_sheet.md" "$course_dir" "reference_sheet"
copy_file "rb175_study_guide.md" "$course_dir" "study_guide"

echo "All study resources have been moved successfully!"
