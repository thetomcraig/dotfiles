# ################
# #General aliases
# ################
# export LANG=C
# export LC_CTYPE=C
# export LC_ALL=en_US.UTF-8

# utils_location="~/slingshot-utils"
# alias utils="cd $utils_location"

# slingshot_root_upper="${HOME}/dev/slingshot/projects/aap"
# slingshot_root="${slingshot_root_upper}/web/aap"



# #################################
# #Handy Slingshot specific aliases
# #################################
# #I made these all start with 'sling' so they would be easy to remember
# alias slingshell="./env/bin/python web/aap/manage.py shell"
# alias slingtestall="pytest . --reuse-db -n auto"
# alias slingtest="pytest $1 -n auto --reuse-db"
# alias slingcov="pytest $1 -n auto --cov=. --cov-report=html"
# alias slingenv="source env/bin/activate"
# alias slingmigrate="python web/aap/manage.py migrate"
# alias slingmakemigrations="python web/aap/manage.py makemigrations"
# alias slingclean='find . -type f -name "*.py[co]" -delete -or -type d -name "__pycache__" -delete -or -type f -name "*.sw*" -delete'
# alias AAA="autopep8 --max-line-length 120 --in-place --aggressive --aggressive $1"
# alias vulture_whitelist="vim $utils_location/vulture_whitelist.py"

# #These get pretty tiring to type out
# alias dev="cd ${HOME}/dev/"
# alias ssu="cd ${slingshot_root_upper} && source ~/.pyenv/versions/slingshot_develop/bin/activate"
# alias ss="cd ${slingshot_root} && source ~/.pyenv/versions/slingshot_develop/bin/activate "
# alias sss="cd ${slingshot_root}/slingshot"
# alias ssst="cd ${slingshot_root}/slingshot/tests"
# alias ssste="cd ${slingshot_root}/slingshot/templates"
# alias sssmo="cd ${slingshot_root}/slingshot/models"
# alias sssmi="cd ${slingshot_root}/slingshot/migrations"
# alias sssh="cd ${slingshot_root}/slingshot/helpers"

# ############
# #VM Settings
# ############
# # export VM_HOSTNAME=localhost
# # export VM_ROOT=${HOME}/vm_localhost



# #########
# #Postgres
# #########
# export PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"

# #Make it easy to start and stop postgres
# alias startpg='lunchy start postgres@9.5'
# alias stoppg='lunchy stop postgres@9.5'
# alias statuspg='pg_ctl -D /usr/local/var/postgres status'



# #####
# # NVM
# #####
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm



# ####
# #TOM
# ####
# alias changedblocal='~/slingshot-utils/slingshot_functions.py change_db LOCAL'
# alias changedbqa='~/slingshot-utils/slingshot_functions.py change_db QA'
# alias changedbstage='~/slingshot-utils/slingshot_functions.py change_db STAGE'
# alias slingstart="~/Dotfiles/session_scripts/slingshot.sh slingshot && tmux attach -t slingshot"
# alias produktizr_start="~/Dotfiles/session_scripts/produktizr.sh && tmux attach -t produktizr"
# alias slingssh="~/slingshot-utils/slingshot_ssh.sh"
# alias sb='vim /Users/tcraig/slingshot-utils/slingshotrc.sh'
# alias P='/Users/tcraig/dev/slingshot/SavageBeast/Engineering/projects/PRODUKTIZR_SEPARATION/back_end && source env/bin/activate'
# alias slingbranch='git rev-parse --abbrev-ref --symbolic-full-name @{u} | grep -o "SLING-[0-9]*"'
# alias slingcopybranch='git rev-parse --abbrev-ref --symbolic-full-name @{u} | grep -o "SLING-[0-9]*" | pbcopy'

# alias coreuibranch='git rev-parse --abbrev-ref --symbolic-full-name @{u} | grep -o "COREUI-[0-9]*"'
# alias coreuibranchhumanname='echo $(git rev-parse --abbrev-ref --symbolic-full-name @{u} | sed  -En "s/(.*)(COREUI)(\-[0-9]+)(-[A-z]+-)*/\2/p")'

