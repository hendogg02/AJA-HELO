#!/bin/bash

dir=$(pwd)

source ${dir}/config_me.sh

## Removes files with a .m3u extension

for f in /volume1/Review/$cmpsInit/preHELO/*; do

    if [[ "${f: -3}" == *"m3u"* ]]
        then
            rm "$f";
    fi      

done

for f in /volume1/Review/$cmpsInit/HELO/*; do

    if [[ "${f: -3}" == *"m3u"* ]]
        then
            rm "$f";
    fi      

done