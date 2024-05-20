#!/bin/bash

#test if ffmpeg is installed
if (ffmpeg -version >/dev/null); then
    echo "ffmpeg installed"
else
    echo "FFMPEG Not installed, installl ffmpeg by command: sudo apt install ffmpeg"
    exit
fi

#Make directory if not exist
if [ ! -d "./downloads/movie" ]; then
    echo "Made the folder ./downloads/movie/"
    mkdir -p "./downloads/movie"
fi

#main loop for downloading
function loop {
    read -p "Site URL (.m3u8): " url_link
    read -p "Movie name: " movie_name
    read -p "Year: " year
    movie_name_filtered=$(echo "$movie_name" | tr ' ' '_' | tr -d ':')
    Dir_movie="./downloads/movie/${movie_name_filtered}_(${year})"

    mkdir -p "$Dir_movie" >/dev/null

    movie_name_join="${Dir_movie}/${movie_name_filtered}_(${year}).mp4"
    echo "Made folder $Dir_movie"
    ffmpeg -i "$url_link" -c copy "$movie_name_join"
    clear
    loop
}

loop
