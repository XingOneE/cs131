#!/bin/bash

# Get current date/time for unique filenames
timestamp=$(date "+%F-%T")

# Define the dataset file (adjust the filename if needed)
dataset="2019-01-h1.csv"

# Check if dataset exists
if [ ! -f "$dataset" ]; then
    echo "Error: Dataset file '$dataset' not found!"
    exit 1
fi

# Define vendor IDs to filter
vendor_ids=("1.0" "2.0" "4.0")

# Process each vendor and create a separate file
for vendor in "${vendor_ids[@]}"; do
    output_file="${timestamp}-${vendor}.csv"
    
    # Extract header and all lines matching the vendor ID
    head -n 1 "$dataset" > "$output_file"  # Copy header
    grep "^$vendor," "$dataset" >> "$output_file"  # Append matching rows

    echo "$output_file created with vendor ID $vendor"
    
    # Add the file to .gitignore
    echo "$output_file" >> .gitignore
done

# Save `wc` results into ws4.txt
echo "Word count results for vendor-separated files:" > ws4.txt
wc ${timestamp}-*.csv >> ws4.txt

# Append .gitignore contents to ws4.txt
echo -e "\nContents of .gitignore:" >> ws4.txt
cat .gitignore >> ws4.txt

echo "Processing complete. Check ws4.txt for details."
