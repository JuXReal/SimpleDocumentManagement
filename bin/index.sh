#!/bin/bash
# Check lockfile
if [ -f index.lock ]
then
    echo "----- Script is already running -----"
    exit
fi
date +%s > index.lock
 
# Update index
recollindex
 
rm index.lock
echo  "----- Finish -----"
