#!/bin/bash

runSegment() {
    TRACK=$(osascript <<EOF
        tell application "System Events"
        set ids to bundle identifier of every application process
        if ids contains "com.swinsian.Swinsian" then
            tell application "Swinsian"
            
            set thetrack to current track
            set trackname to name of thetrack
            set status to player state
            
            set info to [trackname,status]

            end tell
        else
            set info to ""
        end if
        end tell
    EOF)


    INDICATOR=' '
    IFS=',' read -r -a TRACK_PARTS <<< "$TRACK"
    if [ ${TRACK_PARTS[1]} == 'paused' ]; then
        INDICATOR=' '
    fi
    if [ ${TRACK_PARTS[1]} == 'playing' ]; then
        INDICATOR=' '
    fi

    if ((${#TRACK_PARTS[0]} > 15)); then
        echo "${INDICATOR}${TRACK_PARTS[0]:0:13}..."
    else
        echo ${INDICATOR}${TRACK_PARTS[0]}
    fi
}
