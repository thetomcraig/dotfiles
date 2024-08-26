#!/bin/bash

YELLOW='\033[1;33m'
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m' 

# Check if a directory parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

RETURN_CODE=0

# Recursively find all .git directories and process them using process substitution
while read -r gitdir; do
  # Navigate to the git repository directory
  repo_dir=$(dirname "$gitdir")
  cd "$repo_dir" || continue

  # Get the current branch name
  branch=$(git rev-parse --abbrev-ref HEAD)
  repo_string="$repo_dir | Branch: $branch"

  if [ -n "$(git status --porcelain)" ]; then
    printf "${RED} Uncommited : ${repo_string}${NC}\n"
    RETURN_CODE=1
  fi

  if [ -n "$(git log --branches --not --remotes)" ]; then
    printf "${RED}  Unpushed  : ${repo_string}${NC}\n"
    RETURN_CODE=1
  fi

  # If no issues were found, mark as clean
  if [ -z "$(git status --porcelain)" ] && [ -z "$(git log --branches --not --remotes)" ]; then
    printf "${GREEN}   Clean    : ${repo_string}${NC}\n"
  fi

  # Go back to the original directory
  cd - >/dev/null
done < <(find "$1" -name ".git")

exit $RETURN_CODE
