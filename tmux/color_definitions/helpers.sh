#!/bin/bash

load_colors() {
  THEME_NAME=$1
  echo $THEME_NAME
  echo "in function"
  echo "$tmux_dotfiles_location/color_definitions/$THEME_NAME.sh"
  source $tmux_dotfiles_location/color_definitions/$THEME_NAME.sh

  export TMUX_LIGHT_SEGMENT_FG="$DARKER_SELECTION"
  export TMUX_LIGHT_SEGMENT_BG="$NORMAL_BLUE"

  # Windows
  export TMUX_CURRENT_WINDOW_FG="$BRIGHT_YELLOW"
  export TMUX_CURRENT_WINDOW_BG="$NORMAL_YELLOW"
  export TMUX_CURRENT_WINDOW_FG_ZOOMED="$TMUX_LIGHT_SEGMENT_FG"
  export TMUX_CURRENT_WINDOW_BG_ZOOMED="$TMUX_LIGHT_SEGMENT_BG"

  export TMUX_WINDOW_FG="$NORMAL_YELLOW"
  export TMUX_WINDOW_BG="$BACKGROUND"

  # Panes
  export TMUX_PANE_ACTIVE_BORDER_FG="$NORMAL_YELLOW"
  export TMUX_PANE_BORDER_FG="$NORMAL_YELLOW"
  export TMUX_PANE_BG="$BACKGROUND"

  # Messages
  export TMUX_MESSAGE_FG="$FOREGROUND"
  export TMUX_MESSAGE_BG="$BACKGROUND"
  export TMUX_MESSAGE_COMMAND_FG="$FOREGROUND"
  export TMUX_MESSAGE_COMMAND_BG="$BACKGROUND"

  # Dynamic segments
  export TMUX_DARK_SEGMENT_FG="$BRIGHT_CYAN"
  export TMUX_DARK_SEGMENT_BG="$SELECTION"
}
