#!/bin/bash

YELLOW='\033[1;33m'
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m' 

# Check if a directory parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory> [<ignore-string>]"
  exit 1
fi

DIRECTORY="$1"
IGNORE_STRING="$2"
IGNORE_STRING_LOWER=$(echo "$IGNORE_STRING" | tr '[:upper:]' '[:lower:]')

RETURN_CODE=0

# Use a for loop to iterate over the output of the find command directly
find "$DIRECTORY" -name ".git" | while read -r gitdir; do
  # Navigate to the git repository directory
  repo_dir=$(dirname "$gitdir")
  
  # Convert the repository directory to lowercase for case-insensitive comparison
  repo_dir_lower=$(echo "$repo_dir" | tr '[:upper:]' '[:lower:]')

  # If the directory includes the ignore string, skip it
  if [[ -n "$IGNORE_STRING_LOWER" && "$repo_dir_lower" == *"$IGNORE_STRING_LOWER"* ]]; then
    continue
  fi

  cd "$repo_dir" || continue

  # Get the current branch name
  branch=$(git rev-parse --abbrev-ref HEAD)
  repo_string="$repo_dir | Branch: $branch"

  if [ -n "$(git status --porcelain)" ]; then
    printf "${RED} Uncommitted : ${repo_string}${NC}\n"
    RETURN_CODE=1
  fi

  if [ -n "$(git log --branches --not --remotes)" ]; then
    printf "${YELLOW}  Unpushed  : ${repo_string}${NC}\n"
    RETURN_CODE=1
  fi

  # If no issues were found, mark as clean
  if [ -z "$(git status --porcelain)" ] && [ -z "$(git log --branches --not --remotes)" ]; then
    printf "${GREEN}   Clean    : ${repo_string}${NC}\n"
  fi

  # Go back to the original directory
  cd - >/dev/null
done

exit $RETURN_CODE
