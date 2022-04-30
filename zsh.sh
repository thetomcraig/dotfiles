# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc
verbose=false
if $verbose; then echo "LOADING DOTFILES..."; fi

# This is used by a lot of the downstream scripts as well
export DOTFILES_LOCATION="${HOME}/dotfiles"

# Environment Settings
# For macOS vs Linux, and inside vs outside a tmux session
SCRIPT_START="$(date +%s)"
STEP_START="$(date +%s)"
if $verbose; then echo "LOADING ENVIRONMENT SETTINGS..."; fi
source $DOTFILES_LOCATION/zsh_environment_settings.sh
DURATION=$[ $(date +%s) - ${STEP_START} ]
if $verbose; then echo "  OK (Took ${DURATION} s)"; fi

# General ZSH Settings
if $verbose; then echo "LOADING GENERAL SETTINGS..."; fi
STEP_START="$(date +%s)"
source $DOTFILES_LOCATION/zsh_general_settings.sh
DURATION=$[ $(date +%s) - ${STEP_START} ]
if $verbose; then echo " OK (Took ${DURATION} s)"; fi

# OMZ Settings
if $verbose; then echo "LOADING OMZ SETTINGS..."; fi
STEP_START="$(date +%s)"
source $DOTFILES_LOCATION/zsh_omz_settings.sh
DURATION=$[ $(date +%s) - ${STEP_START} ]
if $verbose; then echo " OK (Took ${DURATION} s)"; fi

# GIT Settings
if $verbose; then echo "LOADING GIT SETTINGS..."; fi
STEP_START="$(date +%s)"
source $DOTFILES_LOCATION/zsh_git_settings.sh
DURATION=$[ $(date +%s) - ${STEP_START} ]
if $verbose; then echo " OK (Took ${DURATION} s)"; fi

# TMUX Settings
if $verbose; then echo "LOADING TMUX SETTINGS..."; fi
STEP_START="$(date +%s)"
source $DOTFILES_LOCATION/tmux/zsh_tmux_settings.sh
DURATION=$[ $(date +%s) - ${STEP_START} ]
if $verbose; then echo " OK (Took ${DURATION} s)"; fi

DURATION=$[ $(date +%s) - ${SCRIPT_START} ]
if $verbose; then echo "INITIALIZATION COMPLETE!"; fi
if $verbose; then echo " OK (Took ${DURATION} s in total)"; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
