#!/bin/bash

runSegment() {
  cwd=#{pane_current_path}
  cd ${cwd} 
  branch_name=$(git symbolic-ref HEAD 2>/dev/null | sed -E 's/refs\/heads\///g')
  #echo -n ${branch_name}
}
