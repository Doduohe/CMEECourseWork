#!/bin/bash
# Author: Leo He <Triopleo@gmail.com>
# Script: tabtocsv.sh
# Desc: substitute tabs in a file with commas
#       saves output into a .csv file
# Arguments: 1-> tab delimited file
# Date: Oct 2026

# Accept exactly 1 input
if [[ $# -ne 1 ]]; then
    printf 'Usage: %s input one tab delimited file\n' "$0" >&2
    exit 2
fi

echo "Creating a comma delimited version of $1 ..."

# Create csv and output in results
filename=$(basename "$1")
cat "$1" | tr -s "\t" "," > "../results/$filename.csv"

echo "Done!"

exit 0

