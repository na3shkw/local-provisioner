#!/bin/bash
# convert m4a(.aac) audio file to mp3
if [ $# -ne 2 ]; then
    echo "Missing input and output."
    exit 1
fi
ffmpeg -i $1 -f mp3 -b:a 128k $2
