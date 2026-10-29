#!/bin/bash

if [ ! $1 ] || [ ! $2 ]; then
    echo "Provide names for the source and destination directories!"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Directory $1 doesn't exist!"
    exit 1
fi

if [ ! -d $2 ]; then
    echo "Directory $2 doesn't exist!"
    exit 1
fi

archive_name=$(date '+%d_%m_%Y').back.tar.gz

tar -zcvf "$archive_name" "$1" >> /dev/null

if [ ! "$2" = "./" ]; then
    mv "$archive_name" "$2"
fi
