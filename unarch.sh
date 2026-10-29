#!/bin/bash

if [ ! -f $1 ]; then
    echo "No such file or directory!"
    exit 1
fi

if [[ ! $1 =~ \.[tar|tar\.gz|tar\.bz2] ]]; then
    echo "Unsupported type of the file!"
    exit 2
fi

mkdir unarch_dir
tar -xf "$1" -C unarch_dir && cd unarch_dir

for file in *; do
    file_info=$(file "$file")

    case "$file_info" in
        *'script'*)
            if [ ! -d ~/Code/scripts ]; then
                mkdir -p ~/Code/scripts
            fi

            cp "$file" ~/Code/scripts
        ;;
        *'source'*)
            if [ ! -d ~/Code/source ]; then
                mkdir -p ~/Code/source
            fi

            cp "$file" ~/Code/source
        ;;
        *'text'*)
            if [ ! -d ~/Documents ]; then
                mkdir -p ~/Documents
            fi

            cp "$file" ~/Documents
        ;;
        *'executable'*)
            if [ ! -d ~/Code/bin ]; then
                mkdir -p ~/Code/bin
            fi

            cp "$file" ~/Code/bin
        ;;
        *'image'*)
            if [ ! -d ~/Pictures ]; then
                mkdir -p ~/Pictures
            fi

            cp "$file" ~/Pictures
        ;;
        *'Font'*)
            if [ ! -d ~/.local/share/fonts ]; then
                mkdir -p ~/.local/share/fonts
            fi

            cp "$file" ~/.local/share/fonts
            fc-cache -f
        ;;
        *)
            if [ ! -d ./other ]; then
                mkdir ./other
            fi

            cp "$file" ./other
        ;;
    esac
done

cd ..
rm -r unarch_dir >> /dev/null
