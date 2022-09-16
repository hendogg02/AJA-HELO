#!/bin/bash

################################
# THIS SCRIPT REBOOTS HELO'S ACROSS ALL CAMPUSES LISTED BELOW. 
# TO ADD A NEW CAMPUS, ENSURE THAT INFORMATION IS ADDED TO ALL THREE ARRAYS, OR THIS WILL NOT WORK. 
################################

source config_me.sh

echo "Rebooting $cmpsInit at IP address $heloIP..."
curl 'http://'$heloIP'/config?action=set&paramid=eParamID_Reboot&value=1'
echo "$cmpsInit has rebooted!"
echo ""