#!/bin/bash
# test

echo "What do you want?"

read dat

echo "What month do you want?"

read month

echo "What year do you want?"

read year

year=date -d yesterday +%Y

month= date -d yesterday +%M

day= date -d yesterday +%D

curl "https://www.wunderground.com/history/airport/GNV/$year/$month/$day/DailyHistory.heml?&format=1" > gnv.txt

maxTemp=`awk -F',' '{print $2}' gnv.txt | sort -n | tail -n1`

echo The Max temp is $maxTemp

