# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc

# this is used a lot in "zsh_general_settings.sh"
PROJECTS_ROOT=~/.projects_root

source "${DOTFILES_LOCATION}/get_arch.sh"

if [[ "${ARCH}" == *"mac"* ]]; then
  alias rm="trash"

  DROPBOX_ROOT="${HOME}/Dropbox/TomCraig"
  export DROPBOX_ROOT="${DROPBOX_ROOT}"
  export PROJECTS_ROOT="${PROJECTS_ROOT}"
fi



#########
# SERVERS 
#########
# alias sshariston="ssh tom@ariston"
alias sshariston="mosh tom@ariston"



###################
# EXPORT ENV VARS #
###################
export VIM_EXTRA="${VIM_EXTRA}"
export VIM_COLORSCHEME="${VIM_COLORSCHEME}"
export VIM_AIRLINE_THEME="${VIM_AIRLINE_THEME}"
export TMUX_SESSION_NAME="${TMUX_SESSION_NAME}"



##################
# PATH AND HOOKS #
##################
if [[ "${ARCH}" == *"${linux}"* ]]; then
  # PYENV
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  # RBENV
  export PATH=$HOME/.rbenv/bin:$PATH
  # fzf
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi


if [[ "${ARCH}" == *"mac"* ]]; then
  # AVR GCC (QMK)
  export PATH="/usr/local/opt/avr-gcc@8/bin:$PATH"
  # BREW
  export PATH=/opt/homebrew/bin:$PATH
  export PATH=/opt/homebrew/sbin:$PATH
  # RBENV
  eval "$(rbenv init -)"
  export PATH="/usr/local/sbin:$PATH"
fi

eval "$(direnv hook zsh)"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


########
# CHIT #
########
# if [[ "${ARCH}" == *"mac"* ]]; then
#   eval "$(chit shell-init)"
#   cst () {
#     chit set-theme "${1}"
#     eval "$(chit export-env-vars)"
#   }

#   cs() {
#     chit set-theme "${1}"
#     eval "$(chit export-env-vars)"
#     if [ -n "$TMUX" ]; then
#       Reload tmux environment variables
#     tmux source-file ~/.tmux.conf
#     fi
#   }
# fi

########
# WORK #
########
IN_AYA=false
if [ "$(hostname)" = "RM-TCRAIG" ]; then
  IN_AYA=true
fi
export IN_AYA="${IN_AYA}"





