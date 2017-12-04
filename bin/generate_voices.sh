#!/bin/bash

BIN=$0
BINDIR=$(dirname "$BIN")
VOICES_FILE="$BINDIR/voices.txt"	# assume voices.txt in same directory

for vv in $(cat "$VOICES_FILE"); do
    VOICE="$vv" ./opentx_voices.rb english-taranis.csv betaflight.csv
done
