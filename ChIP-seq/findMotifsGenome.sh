#!/bin/bash

# Define the folder
folder="/data_location/"

# Update the PATH to include the directory containing findMotifsGenome.pl
export PATH=$PATH:/Users/username/homer//bin/

# Change to the specified folder
cd "$folder" || exit

# Loop over all .bed files in the directory and run findMotifsGenome.pl
for peak_file in *.narrowPeak; do
     # Extract the base name of the peak file
    base_name=$(basename "$peak_file" .peak)

    # Define the output directory for each peak file
    output_dir="/output_dir/findMotifsGenome/${base_name}_motifs"

    # Run findMotifsGenome.pl for each peak file
    findMotifsGenome.pl "$peak_file" hg19 "$output_dir" -size given
done
