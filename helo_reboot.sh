#!/bin/bash

$cmpsInfo

echo "Rebooting $cmpsInit at IP address $heloIP..."
curl 'http://'$heloIP'/config?action=set&paramid=eParamID_Reboot&value=1'
echo "$cmpsInit has rebooted!"
echo ""