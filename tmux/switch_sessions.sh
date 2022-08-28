#!/bin/bash


# List of active sessions
all_sessions=($( tmux ls | awk '{printf $1}' | tr ':' '\n'))
echo "all_sessions"
echo "${all_sessions[0]}"
echo "${all_sessions[1]}"
echo "${all_sessions[2]}"

# list of tmuxinator projects
mux_projects=($(tmuxinator list | tail -n +2))
mux_projects=$(IFS=' ' ; echo "${mux_projects[*]}")


get_desired_name_from_list() {
  # Combine and send through fzf, for selection
  # Add "NEW" to the top of the list,
  # for starting a brand new session
  all_choices=$(echo "${all_sessions} ${mux_projects}" | awk '{OFS="\n"; $1=$1}1' | sort -u)
  printf "NEW \n${all_choices}" | fzf --reverse
}


create_or_find_then_attach() {
  session_name="${1}"
  ##########
  # CASE 0 #
  ##########
  # Brand-new session
  echo "\nsession_name"
  echo $session_name
  if [ "${session_name}" = "NEW" ]; then
    new_session_name=0
    IFS=$'\n' sorted_sessions=($(sort -n <<<"${all_sessions[*]}"))
    echo "\nsorted_sessions"
    echo "${sorted_sessions[0]}"
    echo "${sorted_sessions[1]}"
    echo "${sorted_sessions[2]}"
    echo "${sorted_sessions[3]}"
    echo "${sorted_sessions[4]}"
    highest_session_number="${sorted_sessions[0]}"
    echo "\nhighest_session_number"
    echo $highest_session_number
    # If it's an actual number
    if [[ $highest_session_number =~ ^-?[0-9]+$ ]]; then
      echo "its a number"
      new_session_name=$((highest_session_number+1))
    fi
    if ! { [ -n "$TMUX" ]; } then
      tmux new -s $new_session_name
    else
      tmux new -s $new_session_name -d
      tmux switch-client -t $new_session_name
    fi
    unset IFS
    return
  fi

  ##########
  # CASE 1 #
  ##########
  # There is already a running session named session_name
  IFS=':'
  all_sessions=($(tmux ls | awk '{printf $1}'))
  for name in "${all_sessions[@]}"; do
    if [ "${session_name}" == "${name}" ]; then
      if ! { [ -n "$TMUX" ]; } then
        # If outside a tmux session,
        # attach to the desired session
        tmux attach -t $session_name
      else
        # If inside a tmux session already,
        # switch to the desired session
        tmux switch-client -t $session_name
      fi
      return
    fi
  done

  ##########
  # CASE 2 #
  ##########
  # Either tmux is not running OR
  # it's running but there's no session with session_name
  # Additionally, there is a tmuxinator project named session_name
  for name in "${mux_projects[@]}"; do
    if [ "${session_name}" == "${name}" ]; then
      if ! { [ -n "$TMUX" ]; } then
        # If not inside a tmux session,
        # start the tmuxinator project
        tmuxinator start $session_name
      fi
        # If inside a tmux session already,
        # start in the background, then attach
        $(tmuxinator start $session_name &)
        tmux switch-client -t $session_name
      return
    fi
  done

  ##########
  # CASE 3 #
  ##########
  # There was no running session with session_name,
  # AND there is no tmuxinator project with the name either.
  # So start/attach to a new tmux session
  if ! { [ -n "$TMUX" ]; } then
    tmux new -s $session_name
  else
    tmux new -s $session_name -d
    tmux switch-client -t $session_name
  fi
}


if [ "$#" -eq 1 ]; then
  desired_session_name=$(basename $1)
  create_or_find_then_attach $desired_session_name
else
  # If the argument was not passed,
  # give the caller a list to choose from
  desired_session_name=$(get_desired_name_from_list)
  create_or_find_then_attach $desired_session_name
fi

# if were in a tmux session, get the current session name, then use send keys to kill this pane
# might be able to do this without send keys, actually
# tmux send-keys -t dotfiles "tmux kill-pane" ENTER
