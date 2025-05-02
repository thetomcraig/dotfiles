PROJECT_PREFIX='[a-zA-Z]+'

#########
# ALIASES 
#########
# Small ones, similar to vim key bindings
alias g="git status -sb"
alias gpu="git push"
alias gpf="git push -f"
alias gpl="git pull"
alias ga="git add"
alias gc="git checkout"
alias gcp="git cherry-pick ${1}"

# Shortened git commit
# e.g. "gm descriptive words for commit message"
# If nothing specified after gm, open the commit message editor
_gm () {
  if [ $# -eq 0 ]; then
    git commit
  else
    git commit -m "$*"
  fi
}
alias gm="_gm"

alias gd="git diff"
alias gD="git diff develop..${getLocalBranchName}"

alias grd="git rebase -i develop"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias gma="git merge --abort"
# Pretty looking git log
alias gl1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

alias gba="git branch -a"
alias gbd="git branch -d ${1}"
alias gbD="git branch -D ${1}"
alias gcb=createBranch

interactiveCheckout() {
  git checkout $(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf)
}
alias gv="interactiveCheckout"

shortBranchMappings() {
  # Declare an array
  declare -a branch_tuples

  # Read the output of git for-each-ref into the array
  while IFS= read -r line; do
    current_branch=$(echo "$line" | awk '{gsub(/^[^\/]+\/[^\/]+/, "..."); print $1}')
    current_branch="\e[34m$current_branch\e[0m"
    upstream_branch=$(echo "$line" | awk '{print $2}')
    branch_tuples+=(" $current_branch -> $upstream_branch")
  done < <(git for-each-ref --format='%(color:blue)%(refname:short) %(color:red)%(upstream:short)%(color:reset)' --color=always refs/heads)



  if [ "$#" -eq 1 ]; then
    # Use "head" to shorten the array here
  fi
  # Print the array of tuples
  for tuple in "${branch_tuples[@]}"; do
    echo -e "$tuple"
  done
}
alias gvv="shortBranchMappings"


# Large and complicated ones
# Make local branch tracking remote that matches a regex
# For example gg hotfix
alias gg=regexcheckout
# Push this branch and make a new upstream with the same name
alias gsu=gitPushAndSetMatchingUpstream
# Start a pull request for the current branch
alias gpr=gitpullrequest



##################
# CUSTOM FUNCTIONS 
##################
getLocalBranchName() {
  echo $(git for-each-ref --format='%(refname:short)' $(git symbolic-ref -q HEAD))
}

getRemoteBranchName() {
  echo $(git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD))
}


gitpullrequest() {
  local BRANCH_NAME="$(git branch | grep \* | cut -d ' ' -f2)?expand\=1"
  open ${GITHUB_HOSTNAME}/compare/"${BRANCH_NAME}"
}

regexcheckout() {
  # Find a remote branch that includes the string in ${1}
  # Make a new branch to track the remote branch, with a matching name
  git pull && \
  git checkout -b ${1} $(git branch -a | grep ${1}) && \
  git branch -vv | grep '*'
}

gitPushAndSetMatchingUpstream() {
  local BRANCH_NAME=$(getLocalBranchName)
  git push --set-upstream origin "${BRANCH_NAME}"
}

createBranch() {
  ARGS=$(echo "$*" | tr ' ' '-')
  BRANCH_NAME="${ARGS}"
  git checkout -b "$BRANCH_NAME"
}
