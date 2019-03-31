# vim: set syntax=zsh
# au BufReadPost zsh.sh set ft=zsh.rc

alias vev="virtualenv env"
alias seba="source env/bin/activate"
alias pf="pip freeze"
alias pyclean="find . -name '**/*.pyc' -exec rm -f {} \; && find . -name '__pycache__' -exec rm -rf {} \;"
