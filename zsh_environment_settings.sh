# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc

# this is used a lot in "zsh_general_settings.sh"
PROJECTS_ROOT=~/.projects_root

source "${DOTFILES_LOCATION}/get_arch.sh"

#########
# HOST/OS
#########
if [[ "${ARCH}" == *"mac"* ]]; then
  alias rm="trash"
  DROPBOX_ROOT="${HOME}/Dropbox/TomCraig"
  export DROPBOX_ROOT="${DROPBOX_ROOT}"
  export PROJECTS_ROOT="${PROJECTS_ROOT}"
fi


#########
# SERVERS 
#########
alias sshariston="ssh tom@ariston"
# alias ssharistonremote="ssh tom@24.130.253.28 -p 56970"
alias sshjuno="ssh tom@juno"



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
fi


if [[ "${ARCH}" == *"mac"* ]]; then
  # NVM
  if [[ "${ARCH}" == *"mac_intel"* ]]; then
    export NVM_DIR="$HOME/.nvm"
      [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
      [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  else
    export NVM_DIR="$HOME/.nvm"
      [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
      [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  fi

  # AVR GCC (QMK)
  export PATH="/usr/local/opt/avr-gcc@8/bin:$PATH"
  # BREW
  export PATH=/opt/homebrew/bin:$PATH
  export PATH=/opt/homebrew/sbin:$PATH
  # PYENV
  eval "$(pyenv init --path)"
  # PYENV VIRTUALENV
  eval "$(pyenv virtualenv-init -)"
  # RBENV
  eval "$(rbenv init -)"

  export PATH="/usr/local/sbin:$PATH"
fi

eval "$(direnv hook zsh)"


########
# CHIT #
########
if [[ "${ARCH}" == *"mac"* ]]; then
  eval "$(chit shell-init)"
  cst () {
    chit set-theme "${1}"
    eval "$(chit export-env-vars)"
  }

  cs() {
    chit set-theme "${1}"
    eval "$(chit export-env-vars)"
    if [ -n "$TMUX" ]; then
      Reload tmux environment variables
    tmux source-file ~/.tmux.conf
    fi
  }
fi

#########
# CONDA #
#########
if [[ "${IN_COREAD}" == "true" ]]; then
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
          . "/opt/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="/opt/miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
fi
