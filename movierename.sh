#!/bin/bash

# Make directories
Dirs=$(find ./downloads/movie/ -type d) # Get directories

for dir in $Dirs; do
    rename="./plex-ready/movie/$(echo $dir | tr '_' ' ')"
    mkdir -p "$rename"
done

# Rename and move items
Items=$(find ./downloads/movie/ -type f) # Get files

for item in $Items; do
    newlocation="./plex-ready/movie/$(basename $item | tr '_' ' ')"
    mv "$item" "$newlocation"
done

rm ./downloads -r
