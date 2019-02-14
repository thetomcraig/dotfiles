PROJECT_PREFIX='[a-zA-Z]+'
GITHUB_HOSTNAME="https://github.com/welkinhealth/welkin"

getLocalBranchName() {
  echo $(git for-each-ref --format='%(refname:short)' $(git symbolic-ref -q HEAD))

}
getRemoteBranchName() {
  echo $(git for-each-ref --format='%(upstream:short)' $(git symbolic-ref -q HEAD))
}

# Get the jira number from the current banch name
alias jj=getCurrentJiraNumber
getCurrentJiraNumber() {
  local BRANCH_NAME=$(getLocalBranchName)
  local JIRA_NUMBER=$(echo "${BRANCH_NAME}" | grep -oE "(${PROJECT_PREFIX}\-[0-9]+)")
  echo "${JIRA_NUMBER}"
}

# Helper function - make the name for a new feature branch
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

alias g="git status"
alias gpu="git push"
alias gpl="git pull"

alias gc="git checkout"

alias gb="git branch"
alias gba="git branch -a"
alias gv="git branch -vv"
alias gbd="git branch -d ${1}"
alias gbD="git branch -D ${1}"
alias gcb="git checkout -b"

# Stage the deletion of any files you've deleted
alias gdd="git ls-files --deleted -z | xargs -0 git rm"
# Pretty looking git log
alias log="git log --oneline --all --graph --decorate"

alias gd="git diff"

alias ga="git add"
alias gm="git commit -m "

# Start a pull request for the current branch
alias gpr=gitpullrequest
gitpullrequest() {
  local BRANCH_NAME="$(git branch | grep \* | cut -d ' ' -f2)?expand\=1"
  open ${GITHUB_HOSTNAME}/compare/"${BRANCH_NAME}"
}

# Make local branch tracking remote that matches a regex
# For example gg hotfix nov-14
alias gg=gitbranchgrep
gitbranchgrep() {
  git pull && \
  git checkout -b ${1} $(git branch -a | grep ${2}) && \
  git branch -vv
}

# Push this branch and make a new upstream with the same name
alias gsu=gitPushAndSetMatchingUpstream
gitPushAndSetMatchingUpstream() {
  local BRANCH_NAME=$(getLocalBranchName)
  git push --set-upstream origin "${BRANCH_NAME}"
}
