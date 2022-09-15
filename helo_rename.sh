#!/bin/bash

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

# Campus naming and IP
cmpsInitials="ZZ"
cmpsIP="10.0.0.1"

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

BeforeHighSchool="184500"
HighSchool="190100"

if [[ $Day == "Sun" ]]
    then 
        if [[ $BeforeFirstService -gt $FullTime ]] && [[ $FullTime -le $FirstService ]];
            then 
                Time="9"
                Extension=%20"-"%20"(Service"%20"Review)"
        fi
fi

if [[ $Day == "Sun" ]]
    then
         if [[ $BeforeSecondService -gt $FullTime ]] && [[ $FullTime -le $SecondService ]];
            then
                Time="11"
                Extension=%20"-"%20"(Service"%20"Review)"
        fi
fi

if [[ $Day == "Sun" ]]
    then
         if [[ $BeforeThirdService -gt $FullTime ]] && [[ $FullTime -le $ThirdService ]];
            then
                Time="1"
                Extension=%20"-"%20"(Service"%20"Review)"
        fi
fi

if [[ $Day == "Sun" ]]
    then
         if [[ $BeforeMiddleSchool -gt $FullTime ]] && [[ $FullTime -le $MiddleSchool ]];
            then
                Time="4"
                Extension=%20"-"%20"(MiddleSchool)"
        fi
fi

if [[ $Day == "Wed" ]]
    then
         if [[ $BeforeHighSchool -gt $FullTime ]] && [[ $FullTime -le $HighSchool ]];
            then
                Time="7"
                Extension=%20"-"%20"(HighSchool)"
        fi
fi

Cmps="$cmpsInitials"%20"${Date}"%20"${Time}${AP}"%20"${Day}${Extension}"

if [[ $BeforeGeneralName -gt $FullTime ]] && [[ $FullTime -le $GeneralName ]];
    then
        Cmps="$cmpsInitials"%20"${Date}"%20"${Day}"
fi

echo ""
echo "Setting Filename..."
echo "Current timestamp is: $Date $Time$AP $Day"
echo ""
sleep 1s

curl "http://$cmpsIP/config?action=set&paramid=eParamID_FilenamePrefix&value=$Cmps"
sleep 1s

echo ""
echo "Done!"
