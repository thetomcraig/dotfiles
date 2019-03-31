# This is used with my Tmux workflow
# When the login shell starts it checks if it is in the context of a tmux session
# If so, it checks the name of the tmux session
# If the name is the same as the name of a project (tmuxinator), it loads any env variables defined for that project 

project_name=${1}

# Set env vars
export ROOT=~/.projects_root/${project_name}
alias rr="cd ${ROOT}"
alias root="cd ${ROOT}"


# Do specific stuff here
case ${project_name} in
total-immersion-podcast)
  echoGreen "TOTAL IMMERSION LOADED"
  ;;
welkin)
  export GITHUB_HOSTNAME="https://github.com/welkinhealth/welkin"
  echoGreen "WELKIN LOADED"
  ;;
*)
  echoYellow "NO PROJECT SETTINGS LOADED"
  ;;
esac

