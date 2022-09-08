#!/bin/bash

################################
# THIS SCRIPT REBOOTS HELO'S ACROSS ALL CAMPUSES LISTED BELOW. 
# TO ADD A NEW CAMPUS, ENSURE THAT INFORMATION IS ADDED TO ALL THREE ARRAYS, OR THIS WILL NOT WORK. 
################################

campusNAME=ZZ

campusIP=10.0.0.1

echo "Rebooting $campusNAME at IP address $campusIP..."
curl 'http://'$campusIP'/config?action=set&paramid=eParamID_Reboot&value=1'
echo "$campusNAME has rebooted!"
echo ""