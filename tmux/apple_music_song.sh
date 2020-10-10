#!/usr/bin/env bash
ITUNES_TRACK=$(osascript <<EOF
if appIsRunning("Music") then
	tell application "Music"
		if player state is paused then
			set playerStateText to "paused"
		else if player state is playing then
			set playerStateText to "playing"
		else
			set playerStateText to "stopped"
		end if
		set trackName to name of the current track
		set info to [trackName, playerStateText]
	end tell
end if
on appIsRunning(appName)
	tell application "System Events" to (name of processes) contains appName
end appIsRunning
EOF)

IFS=',' read -r -a TRACK_PARTS <<< "$ITUNES_TRACK"

# If Music not running, should have no indicator
# INDICATOR=' '
if [ ${TRACK_PARTS[1]} = playing ]; then
  INDICATOR=' '
elif [ ${TRACK_PARTS[1]} = paused ]; then
  INDICATOR=' '
else
  INDICATOR=''
fi 

# Only echo if there is actually a song playing
if [ $INDICATOR != '' ]; then
  if ((${#TRACK_PARTS[0]} > 15)); then
    echo " ${INDICATOR} ${TRACK_PARTS[0]:0:13}... "
  else
    echo " ${INDICATOR}${TRACK_PARTS[0]} "
  fi
fi
