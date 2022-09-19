#!/bin/bash

dir=$(pwd)

source ${dir}/config_me.sh

curl "http://$heloIP/config?action=set&paramid=eParamID_StreamingProfileSel&value=1"