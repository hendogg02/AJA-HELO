#!/bin/bash

# Put in quotes campus initials that matches with the folder in Synology

cmps="ZZ"

for f in /volume1/Review/$cmps/preHELO/*; do

    if [[ "$f" == *"_001"* ]]
        then
            filename="${f##*preHELO/}"
            mv "$f" "${f%\/preHELO/*}/HELO/${filename%\_001*}${f: -4}";
    fi      

done
