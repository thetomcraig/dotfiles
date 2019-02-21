#!/bin/bash

if [[ $1 == "current" ]]; then
  FOREGROUND=${TMUX_CURRENT_WINDOW_FG}
  BACKGROUND=${TMUX_CURRENT_WINDOW_BG}

  # Check if this window is zoomed
  ACTIVE_PANE_IS_ZOOMED=$(tmux list-panes -F '#F' | grep 'Z')
  if [ -n "${ACTIVE_PANE_IS_ZOOMED}" ]; then
    FOREGROUND=${TMUX_CURRENT_WINDOW_FG_ZOOMED}
    BACKGROUND=${TMUX_CURRENT_WINDOW_BG_ZOOMED}
  fi
  
  echo "#[fg=${FOREGROUND},bg=${BACKGROUND}] #I | #W "

else
  echo "#[fg=${TMUX_WINDOW_FG},bg=${TMUX_WINDOW_BG}] #I | #W "
fi
