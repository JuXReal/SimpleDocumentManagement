#!/bin/bash
# Check lockfile

. ../contrib/config.sh

if [ -f run.lock ]
then
    echo "----- Script is already running -----"
    exit
fi
date +%s > run.lock

# checking for blanks an remove them
find $sdm_raw -name “* *” -type f | rename ‘s/ /_/g’

# Create a backup from input files and move files for ocr to tmp/
cp $sdm_raw/* $sdm_backup/
mv $sdm_raw/* $sdm_tmp/
# Convert .tif to .pdf
echo  "----- Get the .tif and convert -----"
for i in `ls $sdm_tmp/*.tif | cut -d. -f1`;
    do tiff2pdf -o $i.pdf $i.tif;
   
    echo  "converting $i.tif"
    rm  $i.tif;
done
# Start ocr the documents
echo  "----- Starting OCR -----"
echo  "----- Note: 2-5 Minutes per page! Not file -----"
 
for i in `ls $sdm_tmp/*.pdf | tr '\n' '\0' | xargs -0 -n 1 basename`;
    do sh "$sdm_ocr"  $sdm_tmp/$i $sdm_handled/$i &&
 
    echo  " OCR finish from $i"
done
# Remove raw files from ocr layered files
rm $sdm_tmp/*
rm run.lock
echo  "----- Finish -----"
