# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc
echo "LOADING DOTFILES..."

# This is used by a lot of the downstream scripts as well
export DOTFILES_LOCATION="${HOME}/Dotfiles"

# For macOS vs Linux, and inside vs outside a tmux session
SCRIPT_START="$(date +%s)"
STEP_START="$(date +%s)"
echo "LOADING ENVIRONMENT SETTINGS..."
source $DOTFILES_LOCATION/zsh_environment_settings.sh
DURATION=$[ $(date +%s) - ${STEP_START} ]
echoGreen "  OK (Took ${DURATION} s)"

echo "LOADING GENERAL SETTINGS..."
STEP_START="$(date +%s)"
source $DOTFILES_LOCATION/zsh_general_settings.sh
DURATION=$[ $(date +%s) - ${STEP_START} ]
echoGreen " OK (Took ${DURATION} s)"

echo "LOADING OMZ SETTINGS..."
STEP_START="$(date +%s)"
source $DOTFILES_LOCATION/zsh_omz_settings.sh
DURATION=$[ $(date +%s) - ${STEP_START} ]
echoGreen " OK (Took ${DURATION} s)"

echo "LOADING GIT SETTINGS..."
STEP_START="$(date +%s)"
source $DOTFILES_LOCATION/zsh_git_settings.sh
DURATION=$[ $(date +%s) - ${STEP_START} ]
echoGreen " OK (Took ${DURATION} s)"

echo "LOADING TMUX SETTINGS..."
STEP_START="$(date +%s)"
source $DOTFILES_LOCATION/tmux/zsh_tmux_settings.sh
DURATION=$[ $(date +%s) - ${STEP_START} ]
echoGreen " OK (Took ${DURATION} s)"

echo "LOADING PYTHON SETTINGS..."
STEP_START="$(date +%s)"
source $DOTFILES_LOCATION/zsh_python_settings.sh
DURATION=$[ $(date +%s) - ${STEP_START} ]
echoGreen " OK (Took ${DURATION} s)"

DURATION=$[ $(date +%s) - ${SCRIPT_START} ]
echo "INITIALIZATION COMPLETE!"
echoGreen " OK (Took ${DURATION} s)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
