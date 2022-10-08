#!/usr/bin/env bash
echo "Enter filename"
read -p 'File: ' FILENAME
# read the file size
filesize=$(ls -lh $FILENAME | awk '{print  $5}')
echo "The filesize of $FILENAME is $filesize, do you want to truncate the file(yes or no)?"
read truncate
mkdir files_for_analysis
cp $FILENAME files_for_analysis
if (("$truncate"=="yes"))
then
    cd files_for_analysis
    # Step 1: split the input file without the header line
    tail -n +2 $FILENAME | split -d -l 300 - patient_part_
    # Step 2: add the header line to each split file
    for file in patient_part_*
    do
        head -n 1 $FILENAME > with_header_tmp
        cat $file >> with_header_tmp
        mv -f with_header_tmp $file 
    done
    rm $FILENAME
fi



