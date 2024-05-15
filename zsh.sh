# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# This is used by a lot of the downstream scripts
export DOTFILES_LOCATION="${HOME}/dotfiles"

printf "Loading env settings... "
source $DOTFILES_LOCATION/zsh_environment_settings.sh
source $DOTFILES_LOCATION/zsh_general_settings.sh
source $DOTFILES_LOCATION/zsh_omz_settings.sh
source $DOTFILES_LOCATION/zsh_git_settings.sh
source $DOTFILES_LOCATION/zsh_python_settings.sh
source $DOTFILES_LOCATION/tmux/zsh_tmux_settings.sh
if [ "$IN_AYA" = "true" ]; then
  source $DOTFILES_LOCATION/zsh_aya_settings.sh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
