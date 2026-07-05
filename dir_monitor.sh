#!/bin/bash

#default parameters
DIR=${1:-/tmp}
INTERVAL=${2:-60}
THRESHOLD=200

if [ ! -f dir_monitor.csv ]; then
echo "Time;Directory:Size_MB;Status" > dir_monitor.csv
fi

#infinite loop
while true
do

#time stamp
TIME=$(date +"%H:%M:%S")

#get size in MB 
SIZE=$(du -sm "$DIR" 2>/dev/null | awk '{print $1}')

if [ -z "$SIZE" ]; then
echo "Directory not found!"
exit 1
fi

if [ "$SIZE" -ge "$THRESHOLD" ]; then
STATUS="WARNING"
echo "WARNING: $DIR size exceeded ${THRESHOLD}MB!"
else
STATUS="OK"
fi

#write to csv
echo "$TIME;$DIR;$SIZE;$STATUS" >> dir_monitor.csv

#sleep interval
sleep $INTERVAL
done

