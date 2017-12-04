#!/bin/bash

# Run this script from the top of the repository to generate a zip
# file for each voice in voices.txt.

BIN=$0
BINDIR=$(dirname "$BIN")
VOICES_FILE="$BINDIR/voices.txt"	# assume voices.txt in same directory

for vv in $(cat "$VOICES_FILE"); do
    VOICE="$vv" ./opentx_voices.rb english-taranis.csv betaflight.csv

    # zip only the SOUNDS directory from within the voice directory
    pushd output/"$vv"
    zip -9r ../"$vv".zip SOUNDS
    popd
done
