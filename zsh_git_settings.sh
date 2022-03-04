PROJECT_PREFIX='[a-zA-Z]+'

#########
# ALIASES 
#########
# Small ones, similar to vim key bindings
alias g="git status -sb"
alias gpu="git push"
alias gpf="git push -f"
alias gpl="git pull"

alias gc="git checkout"
alias gcp="git cherry-pick ${1}"

alias ga="git add"
alias gm="git commit -m "

alias gd="git diff"
alias gD="git diff develop..${getLocalBranchName}"

alias grd="git rebase -i develop"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
# Pretty looking git log
alias gl1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

alias gba="git branch -a"
alias gv="git branch --sort=committerdate -vv"
alias gbd="git branch -d ${1}"
alias gbD="git branch -D ${1}"
alias gcb="git checkout -b"

# Large and complicated ones
# Make local branch tracking remote that matches a regex
# For example gg hotfix nov-14
alias gs=regexcheckout
alias gg=regexcheckoutnew
# Stage the deletion of any files you've deleted
alias grm="git ls-files --deleted -z | xargs -0 git rm"
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

# Input: URL that looks like: "PROJECT-763: Add dropdown to homepage"
# Output: string that looks like: "PROJECT-763_add_dropdown_to"
constructBranchName() {
  local JIRA_NUMBER=$(echo "${1}" | grep -oE "(${PROJECT_PREFIX}\-[0-9]+)")

  local WORDS=($(echo "${1}"| grep -oE "([A-z]+)"))
  local FIRST_THREE_WORDS="${WORDS[@]:1:3}"
  local FIRST_THREE_WORDS_NO_SPACES=$(echo "${FIRST_THREE_WORDS}" | sed 's/\ /_/g')
  local FIRST_THREE_WORDS_LOWER=$(echo "${FIRST_THREE_WORDS_NO_SPACES}" | tr '[:upper:]' '[:lower:]')
  local BRANCH_NAME="${JIRA_NUMBER}_${FIRST_THREE_WORDS_LOWER}"

  echo "${BRANCH_NAME}"
}


gitpullrequest() {
  local BRANCH_NAME="$(git branch | grep \* | cut -d ' ' -f2)?expand\=1"
  open ${GITHUB_HOSTNAME}/compare/"${BRANCH_NAME}"
}

regexcheckout() {
  # For checking out a present branch
  local DESIRED_BRANCH=$(git branch | grep ${1} | xargs)
  git checkout "${DESIRED_BRANCH}"
}

regexcheckoutnew() {
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

# Get the jira number from the current banch name
alias jj=getCurrentJiraNumber
getCurrentJiraNumber() {
  local BRANCH_NAME=$(getLocalBranchName)
  local JIRA_NUMBER=$(echo "${BRANCH_NAME}" | grep -oE "(${PROJECT_PREFIX}\-[0-9]+)")
  echo "${JIRA_NUMBER}"
}
