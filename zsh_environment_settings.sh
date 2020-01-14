# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc

#########
# HOST/OS
#########
host=$(uname -a)
if [[ $host == *"Darwin"* ]]; then
  alias rm="trash"
  alias cat="bat"
  alias diff="diff-so-fancy"

  export dropbox_root="~/Dropbox/TomCraig"
fi

export projects_root="$dropbox_root/Projects"
export ROOT="${HOME}/.projects_root/${project_name}"
alias rr="cd ${ROOT}"
alias root="cd ${ROOT}"

export wiki_root="$projects_root/tomcraigslist"



##################
# TMUX ENVIRONMENT
##################
# If in a tmux session, attempt to load the project's settings
if [ -n "$TMUX" ]; then
  tmux_session_name=$(tmux display-message -p '#S')
  source "${ROOT}/.tmux_settings.sh"
fi

