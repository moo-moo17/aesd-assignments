#!/bin/bash

# Check if both arguments are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Missing arguments."
  echo "Usage: ./finder.sh <directory_path> <search_string>"
  exit 1
fi

# Assign arguments to variables
filesdir="$1"
searchstr="$2"

# Check if the specified directory exists and is a directory
if [ ! -d "$filesdir" ]; then
  echo "Error: $filesdir is not a valid directory."
  exit 1
fi

# Find all files in the directory and subdirectories, then search for matching lines
file_count=0
matching_lines=0

# Using find to locate files and grep to search for the string within those files
while IFS= read -r file; do
  file_count=$((file_count + 1))
  matching_lines_in_file=$(grep -c "$searchstr" "$file" 2>/dev/null)
  matching_lines=$((matching_lines + matching_lines_in_file))
done < <(find "$filesdir" -type f)

# Print the results
echo "The number of files are $file_count and the number of matching lines are $matching_lines."
