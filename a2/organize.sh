#!/bin/bash

# Check if user provided a directory
if [ -z "$1" ]; then
    echo "Usage: organize <directory>"
    exit 1
fi

# Assign directory
dir="$1"

# Validate directory existence
if [ ! -d "$dir" ]; then
    echo "Error: Directory '$dir' not found!"
    exit 1
fi

# Define categories and file extensions
declare -A categories=(
    ["Documents"]="pdf docx txt md odt"
    ["Images"]="jpg jpeg png gif bmp svg"
    ["Videos"]="mp4 mkv avi mov"
    ["Music"]="mp3 wav flac m4a"
    ["Archives"]="zip tar gz rar 7z"
    ["Scripts"]="sh py js rb php"
)

# Create folders if they don't exist
for folder in "${!categories[@]}"; do
    mkdir -p "$dir/$folder"
done

# Move files to corresponding folders
for folder in "${!categories[@]}"; do
    for ext in ${categories[$folder]}; do
        mv "$dir"/*."$ext" "$dir/$folder" 2>/dev/null
    done
done

echo "Files organized in '$dir'."

