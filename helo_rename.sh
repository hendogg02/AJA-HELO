#!/bin/bash

# Custom variables
# Campus naming and IP
cmpsInit="ZZ"
heloIP="10.0.0.1"

# To change the time hhmmss are all ran together. This is military time. If it is 8 o'clock do not write 08 but rather just 8. 
# Add one minute to the record time to give buffer for seconds past.
BeforeGeneralName="25500"
GeneralName="30100"

BeforeFirstService="84500"
FirstService="90100"

BeforeSecondService="104500"
SecondService="110100"

BeforeThirdService="124500"
ThirdService="130100"

BeforeMiddleSchool="154500"
MiddleSchool="160100"
MiddleSchoolName="Middle School"

BeforeHighSchool="184500"
HighSchool="190100"
HighSchoolName="High School"

#--------------------------------------------

# Current Day calculator
Date=$(date +"%m-%d-%Y")
Day=$(date +"%a")
Hour=$(date +"%H")
HourRemoveZero=${Hour:0:1}
if [[ $HourRemoveZero -eq "0" ]]
    then Hour=${Hour:1}
fi

if [[ $Hour -le "11" ]]
    then AP="AM"
    else AP="PM"
fi

Time=$(date +"%I%M")
RemoveZero=${Time:0:1}
if [[ $RemoveZero -eq "0" ]]
    then Time=${Time:1}
fi

FullTime=$(date +"%H%M%S")
FirstTimeCharacter=${FullTime:0:1}
if [[ $FirstTimeCharacter -eq "0" ]]
    then FullTime=${FullTime:1}
fi


# Renaming scripts
if [[ $Day == "Sun" ]]
    then 
        if [[ $BeforeFirstService -gt $FullTime ]]
            then echo "Before 9am"
            elif [[ $FullTime -le $FirstService ]]
            then 
                Time="9"
                Extension=%20"-"%20"(Service"%20"Review)"
        fi
fi

if [[ $Day == "Sun" ]]
    then
         if [[ $BeforeSecondService -gt $FullTime ]]
            then echo "Before 11am"
            elif [[ $FullTime -le $SecondService ]]
            then
                Time="11"
                Extension=%20"-"%20"(Service"%20"Review)"
        fi
fi

if [[ $Day == "Sun" ]]
    then
         if [[ $BeforeThirdService -gt $FullTime ]]
            then echo "Before 1pm"
            elif [[ $FullTime -le $ThirdService ]]
            then
                Time="1"
                Extension=%20"-"%20"(Service"%20"Review)"
        fi
fi

if [[ $Day == "Sun" ]]
    then
         if [[ $BeforeMiddleSchool -gt $FullTime ]]
            then echo "Before 4pm"
            elif [[ $FullTime -le $MiddleSchool ]]
            then
                Time="4"
                Extension=%20"-"%20"(${MiddleSchoolName})"
        fi
fi

if [[ $Day == "Wed" ]]
    then
         if [[ $BeforeHighSchool -gt $FullTime ]]
            then echo "Before 7pm"
            elif [[ $FullTime -le $HighSchool ]]
            then
                Time="7"
                Extension=%20"-"%20"(${HighSchoolName})"
        fi
fi

# The AJA Filename Prefix based on above rename variables.
prefix="${cmpsInit}"%20"${Date}"%20"${Time}${AP}"%20"${Day}${Extension}"

# Top of the day generic naming for crash record.
if [[ $BeforeGeneralName -gt $FullTime ]]
    then echo "Before 3am"
    elif [[ $FullTime -le $GeneralName ]]
    then
        prefix="${cmpsInit}"%20"${Date}"%20"${Day}"
fi

echo ""
echo "Setting Filename..."
echo "Current timestamp is: $Date $Time$AP $Day"
echo ""
sleep 1s

# Command sent to AJA Helo.
curl "http://$heloIP/config?action=set&paramid=eParamID_FilenamePrefix&value=$prefix"
sleep 1s

echo ""
echo "Done!"
