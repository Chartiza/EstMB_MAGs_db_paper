#!/bin/bash

# Set the root directory
runFld=$(pwd)

# Iterate through subfolders
for SMPL_dir in "$runFld"/Bins_DB_MultiBinning/*/; do
    SMPL=$(basename "$SMPL_dir")
    echo "$SMPL"

    # Rename the *.fa files
    find $SMPL_dir'/dastool/bins_DASTool_bins' -type f -name "*.fa" | while read -r fa_file; do
        new_name="${SMPL}_$(basename "$fa_file")"
        mv "$fa_file" "$(dirname "$fa_file")/$new_name"
    done
done