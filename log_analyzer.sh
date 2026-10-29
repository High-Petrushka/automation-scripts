#!/bin/bash

if [ ! $1 ]; then
    echo "Provide the file path!"
    exit 1
fi

if [ ! -f $1 ]; then
    printf "The file %s doesn't exist!\n" "$1"
    exit 1
fi

timestamp_regexp='[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]+\+[0-9]{2}:[0-9]{2}'

total_lines=$(cat $1 | wc -l)

error_msg=$(cat $1 | grep 'ERROR' | wc -l)
warning_msg=$(cat $1 | grep 'WARNING' | wc -l)
info_msg=$(cat $1 | grep 'INFO' | wc -l)
debug_msg=$(cat $1 | grep 'DEBUG' | wc -l)

first_timestamp=$(head -n 1 "$1" | grep -oE "$timestamp_regexp")
last_timestamp=$(tail -n 1 "$1" | grep -oE "$timestamp_regexp")

printf "Total number of lines: %s\n" "$total_lines" > analyze.log
echo "" >> analyze.log

printf "ERROR - %s\n" "$error_msg" >> analyze.log
printf "WARNING -  %s\n" "$warning_msg" >> analyze.log
printf "INFO - %s\n" "$info_msg" >> analyze.log
printf "DEBUG -  %s\n" "$debug_msg" >> analyze.log
echo "" >> analyze.log

printf "First log entry timestamp: %s\n" "$first_timestamp" >> analyze.log
printf "Last log entry timestamp: %s\n" "$last_timestamp" >> analyze.log

if [ $2 ]; then
    echo "" >> analyze.log
    for line in "$(cat "$1" | grep "$2")"; do
        echo "$line" >> analyze.log
    done
fi