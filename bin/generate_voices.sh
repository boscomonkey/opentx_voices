#!/bin/bash

# Run this script from the top of the repository to generate a zip
# file for each voice in voices.txt.

BIN=$0
BINDIR=$(dirname "$BIN")
VOICES_FILE="$BINDIR/voices.txt"	# assume voices.txt in same directory

# output and release directories are assumed to be off repo root
TOPDIR=$(dirname "$BINDIR")

# output directory is same level as bin dir
OUTDIR="$TOPDIR"/output
[ -d "$OUTDIR" ] || mkdir -p "$OUTDIR"

# iterate thru OpenTX 2.1 and 2.2
for version in ver2.1 ver2.2; do

    # iterate through entries in voices.txt and generate voice packs
    for vv in $(cat "$VOICES_FILE"); do
        VOICEDIR="$OUTDIR"/"$vv"

        # clean out voice track directory so versions 2.1 and 2.2 don't collide
        [ -d "$VOICEDIR" ] && rm -rf "$VOICEDIR"
        VOICE="$vv" ./opentx_voices.rb $version/standard-tracks.csv betaflight.csv

        # release directory is off top dir, plus lang, plus OpenTX version
        #	- assume en for time being
        RELDIR="$TOPDIR"/release/en/"$version"
        [ -d "$RELDIR" ] || mkdir -p "$RELDIR"

        # zip only the SOUNDS directory from within the voice directory
        pushd "$VOICEDIR"

        # remove zip file if it exists so we're adding insteading of updating
        ZIPFILE="../../$RELDIR"/"$vv".zip
        [ -f "$ZIPFILE" ] && rm "$ZIPFILE"

        # quiet, recursive, maximum compression level
        zip -qr9 "$ZIPFILE" SOUNDS
        popd
    done

done
