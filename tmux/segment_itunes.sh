#!/usr/bin/env bash
ITUNES_TRACK=$(osascript <<EOF
if appIsRunning("iTunes") then
    tell app "iTunes" 
 		if player state is paused then
            set playerStateText to "paused"
        else if player state is playing then
            set playerStateText to "playing"
        else
            set playerStateText to "ptopped"
        end if
		set trackName to name of the current track
		set info to [trackName, playerStateText]
    end tell
end if
on appIsRunning(appName)
    tell app "System Events" to (name of processes) contains appName
end appIsRunning
EOF)

runSegment() {
	IFS=',' read -r -a TRACK_PARTS <<< "$ITUNES_TRACK"
	INDICATOR=' '
	if [ ${TRACK_PARTS[1]} == 'paused' ]; then
		INDICATOR=' '
	fi
	if [ ${TRACK_PARTS[1]} == 'playing' ]; then
		INDICATOR=' '
	fi

	if ((${#TRACK_PARTS[0]} > 15)); then
		echo "${INDICATOR}${TRACK_PARTS[0]:0:13}..."
	else
		echo "${INDICATOR}${TRACK_PARTS[0]}"
	fi
}
