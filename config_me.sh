#!/bin/bash

# Campus Initials.
cmpsInit="ZZ"

# Helo IP at campus.
heloIP="10.0.0.1"

# Script location
scriptLoc="/volume1/Scripts/$cmpsInit/"

# Helo recording location
recLoc="/volume1/Review/$cmpsInit/PreHELO"

# Finished recording location for syncing
syncLoc="/volume1/Review/$cmpsInit/HELO"

# Only other file to check for modifications is helo_rename.sh


## look for $cmpInfo in an array of files and replace with $cmpInit and $heloIP