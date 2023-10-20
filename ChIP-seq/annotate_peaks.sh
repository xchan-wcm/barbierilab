#!/bin/bash

# Update the PATH to include the directory containing Homer binaries
#export PATH=$PATH:/Users/username/homer/bin/

# Define the directory containing the peak files
peak_dir="/peak_dir/macs2/narrow_peak/" 

# Define the output directory for all peak files
output_dir_gained="/output_dir_gained/annotate_gained/ARE"

# Define the motif file
motif_file="/motif_file_dir/are.motif"

# Create the output directories if they do not exist
mkdir -p "$output_dir_gained"

# Loop over all peak files in the directory and analyze them
for peak_file in "$peak_dir"/*.txt; do
  # Continue if it's not a file
  [ ! -f "$peak_file" ] && continue

  # Extract the base name of the peak file
  base_name=$(basename "$peak_file" .txt)

  # Define the output file for gained regions
  output_file="$output_dir_gained/${base_name}_annotated.txt"

  # Run annotatePeaks.pl for the gained regions peak file
  annotatePeaks.pl "$peak_file" hg19 -m "$motif_file" -size 1000 -hist 5 > "$output_file"
done
