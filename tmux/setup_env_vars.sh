dotfiles_location=$(cd "$(dirname "$0")" && cd .. && pwd)
source $dotfiles_location/helper_functions.sh

project_name=${1}
echo "project_name"
echo ${project_name}

project_root=~/.projects_root/${project_name}
alias root="cd ${project_root}"



case ${project_name} in
total-immersion-podcast)
  echoGreen "TOTAL IMMERSION ENGAGED"
  ;;
*)
  echoYellow "  NO ENV VARS"
  ;;
esac

