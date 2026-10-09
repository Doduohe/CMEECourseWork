#!/bin/bash
# Author: Leo He <Triopleo@gmail.com>
# Script: tabtocsv.sh
# Desc: substitute tabs in a file with commas
#       saves output into a .csv file
# Arguments: 1-> tab delimited file
# Date: Oct 2026

if [[ $# -ne 1 ]]; then
    printf 'Usage: %s input one tab delimited file\n' "$0" >&2
    exit 2
fi

echo "Creating a comma delimited version of $1 ..."

cat "$1" | tr -s "\t" "," > "$1".csv

echo "Done!"

exit