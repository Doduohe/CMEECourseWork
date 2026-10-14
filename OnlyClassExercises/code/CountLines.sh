#!/bin/bash

NumLines=`wc -l < "$1"`
#or NumLines=$(wc -l < "$1")
echo "The file $1 has $NumLines lines"
echo 