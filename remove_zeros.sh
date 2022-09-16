#!/bin/bash

source config_me.sh

## Looking at a filename of ZZ 08-14-2022 9AM Sun - (Sun Review)_001_000001.mp4 and removing the zeros.
# ${f: -4} is grabbing the last 4 characters of a string.

for f in /volume1/Review/$cmpsInit/HELO/*; do

    if [[ "$f" == *"_001"* ]]
        then
            mv "$f" "${f%%\_001*}${f: -4}";
    fi      

done
