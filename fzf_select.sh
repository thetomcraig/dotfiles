#!/bin/bash

# List of active seesions
all_sessions=($( tmux ls | awk '{printf $1}' | tr ':' ' '))
all_sessions=$( echo "${all_sessions[*]}")

# list of tmuxinator projects
mux_projects=($(tmuxinator list | tail -n +2))
mux_projects=$(IFS=' ' ; echo "${mux_projects[*]}")

switch_or_create() {
  tmux switch-client -t $1
}

# Combine and send through fzf
# This will switch to the session if it's running
# need to inrerpret if it's a tmuxinator project hat is not running
# and if so, start it and attach
echo "${all_sessions} ${mux_projects}" | awk '{OFS="\n"; $1=$1}1' | sort | fzf --reverse | xargs tmux switch-client -t 
