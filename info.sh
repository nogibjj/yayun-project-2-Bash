#!/usr/bin/env bash
echo "Enter filename"
read -p 'File: ' FILENAME
# read the file size
filesize=$(ls -lh $FILENAME | awk '{print  $5}')
echo "$FILENAME has a size of $filesize"
# see how many data in this datasets
lines=$(wc -l < $FILENAME)
echo ""
echo "This dataset has" $lines "observations of patients data."
echo ""
# see how many column in this datasets
columns=$(head -n 1 < $FILENAME)
echo "This dataset include variables:"
echo "$columns"
echo ""


