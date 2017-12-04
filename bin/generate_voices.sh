#!/bin/bash

# Run this script from the top of the repository to generate a zip
# file for each voice in voices.txt.

BIN=$0
BINDIR=$(dirname "$BIN")
VOICES_FILE="$BINDIR/voices.txt"	# assume voices.txt in same directory

# output directory is same level as bin dir
OUTDIR=$(dirname "$BINDIR")/output
[ -d "$OUTDIR" ] || mkdir -p "$OUTDIR"

# release directory is same level as bin dir
RELDIR=$(dirname "$BINDIR")/release
[ -d "$RELDIR" ] || mkdir -p "$RELDIR"

# iterate through entries in voices.txt and generate voice packs
for vv in $(cat "$VOICES_FILE"); do
    VOICE="$vv" ./opentx_voices.rb english-taranis.csv betaflight.csv

    # zip only the SOUNDS directory from within the voice directory
    pushd "$OUTDIR"/"$vv"

    # remove zip file if it exists so we're adding insteading of updating
    ZIPFILE="../../$RELDIR"/"$vv".zip
    [ -f "$ZIPFILE" ] && rm "$ZIPFILE"

    # quiet, recursive, maximum compression level
    zip -qr9 "$ZIPFILE" SOUNDS
    popd
done
