#!/usr/bin/env bash

TITLE="${1}"
WINDOW_WIDTH="${2}"

SMALL=90
MEDIUM=140

NUM_WINDOWS=$(tmux list-windows | wc -l)

HEAD="${TITLE:0:1}"
TAIL="${TITLE:1}"
TAIL_WOUT_VOWELS="${TAIL//[AEIOUaeiou]/}"

SMART_TITLE="${TITLE}"
# If width <= small, title is first char
if [ "$WINDOW_WIDTH" -le "$SMALL" ]; then
  SMART_TITLE="${HEAD:0:1}"
# If small < width <= medium, title has no vowels
elif [ "$WINDOW_WIDTH" -le "$MEDIUM" ]; then
  SMART_TITLE="${HEAD}${TAIL_WOUT_VOWELS}"
fi
# If medium < width, title unchanged

echo "${SMART_TITLE}"
