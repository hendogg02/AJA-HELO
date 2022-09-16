#!/bin/bash

source cmps_info.sh

# Put in quotes campus initials that matches with the folder in Synology

for f in /volume1/Review/$cmpsInit/preHELO/*; do

    if [[ "$f" == *"_001"* ]]
        then
            filename="${f##*preHELO/}"
            mv "$f" "${f%\/preHELO/*}/HELO/${filename%\_001*}${f: -4}";
    fi      

done
