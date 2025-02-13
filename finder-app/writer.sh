#!/bin/bash

# Check if the arguments are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: Missing arguments."
  echo "Usage: ./writer.sh <file_path> <text_string>"
  exit 1
fi

# Assign arguments to variables
writefile="$1"
writestr="$2"

# Create the directory path if it doesn't exist
dir=$(dirname "$writefile")
if [ ! -d "$dir" ]; then
  echo "Directory does not exist, creating it: $dir"
  mkdir -p "$dir"
  if [ $? -ne 0 ]; then
    echo "Error: Could not create directory $dir."
    exit 1
  fi
fi

# Write the text string to the specified file, overwriting it
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
  echo "Error: Could not write to file $writefile."
  exit 1
fi

echo "File $writefile created and written successfully."
