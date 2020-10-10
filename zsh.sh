# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# This is used by a lot of the downstream scripts as well
export DOTFILES_LOCATION="${HOME}/Dotfiles"

# For macOS vs Linux, and inside vs outside a tmux session
echo "LOADING ENVIRONMENT SETTINGS..."
source $DOTFILES_LOCATION/zsh_environment_settings.sh

echo "LOADING GENERAL SETTINGS..."
source $DOTFILES_LOCATION/zsh_general_settings.sh
echoGreen "OK"

echo "LOADING OMZ SETTINGS..."
source $DOTFILES_LOCATION/zsh_omz_settings.sh
echoGreen "OK"

echo "LOADING GIT SETTINGS..."
source $DOTFILES_LOCATION/zsh_git_settings.sh
echoGreen "OK"

echo "LOADING TMUX SETTINGS..."
source $DOTFILES_LOCATION/tmux/zsh_tmux_settings.sh
echoGreen "OK"

# PYTHON ALISES
echo "LOADING PYTHON SETTINGS..."
source $DOTFILES_LOCATION/zsh_python_settings.sh
echoGreen "OK"
echo "INITIALIZATION COMPLETE"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
