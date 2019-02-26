#!/bin/bash

# Default 
FOREGROUND_COLOR="${TMUX_WINDOW_FG}"
FOREGROUND_COLOR="${TMUX_WINDOW_FG}"

# Overide - color the current window
if [[ $1 == "current" ]]; then
  FOREGROUND_COLOR=${TMUX_CURRENT_WINDOW_FG}
  BACKGROUND_COLOR=${TMUX_CURRENT_WINDOW_BG}
  # Overide - color the current window with the ZOOM color
  ACTIVE_PANE_IS_ZOOMED=$(tmux list-panes -F '#F' | grep '*Z')
  if [ -n "${ACTIVE_PANE_IS_ZOOMED}" ]; then
    FOREGROUND_COLOR=${TMUX_CURRENT_WINDOW_FG_ZOOMED}
    BACKGROUND_COLOR=${TMUX_CURRENT_WINDOW_BG_ZOOMED}
  fi
fi

echo "#[fg=${FOREGROUND_COLOR},bg=${BACKGROUND_COLOR}] #I | #W "
