# Migration Guide

This document outlines the steps for migrating content from a personal Launch School repository to this organized repository structure.

## Prerequisites
- Git installed and configured
- Access to both personal repository and organization repository
- Local copy of the personal repository

## Migration Steps

### 1. Clone Repositories
```bash
# Clone the personal repository if you don't have it locally
git clone https://github.com/JoshuaMichaelHall/LS.git personal-ls

# Clone the new organization repository
git clone https://github.com/JoshuaMichaelHall-Tech/launch-school-coursework.git
```

### 2. Create Course Directories
```bash
# Navigate to the new repository
cd launch-school-coursework

# Create directories for each course
mkdir -p rb101 rb109 rb120 rb129 rb130 rb139 rb175 rb185 rb189 resources/{cheatsheets,diagrams,reference_materials}
```

### 3. Copy and Organize Files
For each course module:

```bash
# Example for rb120
cp -r ../personal-ls/rb120/* rb120/

# Clean up any unnecessary files
rm -rf rb120/*.DS_Store
```

Repeat for each course directory, organizing files into appropriate subdirectories.

### 4. Document Each Course
Create a README.md in each course directory explaining:
- Course focus and objectives
- Key concepts covered
- Major projects or assignments
- Personal learning insights

### 5. Commit Changes
```bash
# Add all files
git add .

# Commit with a descriptive message
git commit -m "[DOCS] Migrate and organize Launch School coursework"

# Push to the organization repository
git push origin main
```

### 6. Archive Original Repository
Once migration is complete:
1. Update the README.md in your personal repository to indicate the migration
2. Consider archiving the repository if no longer actively used

## Post-Migration Tasks
- Review file organization for each course
- Ensure no sensitive information is included
- Add appropriate documentation to each project
- Update cross-references between projects
