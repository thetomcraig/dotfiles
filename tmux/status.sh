#!/bin/bash

source ~/dotfiles/themes/main_colors.sh
source ~/dotfiles/tmux/segment.sh

displayStatus() {
  if [[ $1 == "left" ]]; then
    displaySegment "session" "${TMUX_LIGHT_SEGMENT_FG}" "${TMUX_LIGHT_SEGMENT_BG}"
    displaySegment "database" "${TMUX_DARK_SEGMENT_FG}" "${TMUX_DARK_SEGMENT_BG}"
  else
    displaySegment "swinsian" "${TMUX_DARK_SEGMENT_FG}" "${TMUX_DARK_SEGMENT_BG}"
    displaySegment "time" "${TMUX_DARK_SEGMENT_FG}" "${TMUX_DARK_SEGMENT_BG}"
    displaySegment "battery" "${TMUX_DARK_SEGMENT_FG}" "${TMUX_DARK_SEGMENT_BG}"
    displaySegment "hostname" "${TMUX_LIGHT_SEGMENT_FG}" "${TMUX_LIGHT_SEGMENT_BG}"
  fi

  exit 0
}

displayStatus "$1"
