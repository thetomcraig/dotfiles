# This is used with my Tmux workflow
# When the login shell start,
# it checks if it is in the context of a tmux session
# If so, it runs this with the tmux session name
# Something like this:
#   source setup_env_vars.sh $(tmux display-message -p '#S')

project_name=${1}
echo "project_name"

# Set env vars
export ROOT=~/.projects_root/${project_name}
alias rr="cd ${ROOT}"
alias root="cd ${ROOT}"


# Do specific stuff here
case ${project_name} in
total-immersion-podcast)
  echoGreen "TOTAL IMMERSION ENGAGED"
  ;;
*)
  echoYellow "  NO ENV VARS"
  ;;
esac

