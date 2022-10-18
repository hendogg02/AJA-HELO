#!/bin/bash

################################
# THIS SCRIPT SETS THE SCHEDULER TO RECORD ONLY
# OPTION 1: RECORD
# OPTION 2: STREAM
# OPTION 3: RECORD + STREAM
################################

source config_me.sh

curl "http://$heloIP/config?action=set&paramid=eParamID_SchedulerActivity&value=1"
echo "$cmpsInit Helo scheduler has been set to stream only."
