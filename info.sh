#!/usr/bin/env bash
read -p 'File: ' FILENAME

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
