#!/bin/bash

search_dir="./"

if [ $1 ]; then
    if [ ! -d $1 ]; then
        echo "No such directory" >&2
        exit 1
    else
        search_dir="$1"
    fi
fi

files_count=0
for file in $(ls -a "$search_dir"); do
    files_count=$(($files_count+1))
done

#disk_usage_info=$(du -sh "$search_dir" | grep -oE '[^\.\s\/]')
disk_usage_info=$(du -sh "$search_dir" | grep -oE '[0-9]+[A-Z]')
disk_usage=""

for letter in $disk_usage_info; do
    disk_usage=$disk_usage$letter
done

most_recent_files=$(ls -lt "$search_dir" | head -n 4 | grep -oE '[A-Z][a-z]{2} \s?[0-9]{1,2} [0-9]{2}:[0-9]{2} [A-Za-z0-9\.\_\-]+')
recent=""

#printf "Total number of items: %s\n\n" $files_count
#printf "Total disk usage: %s\n\n" $disk_usage
#echo "Most recently modified files:"
#echo "$most_recent_files"

for file_info in $most_recent_files; do
    recent="$recent$file_info "
done

printf "Items  |  Space  |  Recent Files\n"
printf "%s\t  %s\t    %s\n" "$files_count" "$disk_usage" "$recent"
