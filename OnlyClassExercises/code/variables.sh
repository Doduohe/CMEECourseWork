#!/bin/bash
# Author: Leo He <Triopleo@gmail.com>
# Script: variables.sh
# Desc: Simple shell script demonstrating input variables
# Arguments: 2
# Date: October 2026

printf 'This script was called with %s parameters\n' "$#"
printf 'The script was invoked as %s\n'  "$0"
printf 'Argument: <%s>\n' "$@"
printf 'The first argument is <%s>\n' "$1"
printf 'The second argument is <%s>\n' "$2"

my_value='some string'
printf 'Current value: <%s>\n' "$my_value"
printf 'Please enter a new string: '
IFS= read -r my_value
printf 'New value: <%s>\n' "$my_value"

printf 'Enter two integers seperated by spaces: '
read -r first_number second_number
printf 'You entered %s and %s\n' "$first_number" "$second_number"
my_sum=$((first_number + second_number))
printf 'Their sum is: %s\n' "$my_sum"