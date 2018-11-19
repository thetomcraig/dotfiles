PROJECT_PREFIX='[a-zA-Z]+'
GITHUB_HOSTNAME="https://github.com/welkinhealth/welkin"

# Helper function - make the name for a new feature branch
# Input: URL that looks like: "PROJECT-763: Add dropdown to homepage"
# Output: string that looks like: "PROJECT-763_add_dropdown_to"
construct_branch_name() {
  local JIRA_NUMBER=$(echo "${1}" | grep -oE "(${PROJECT_PREFIX}\-[0-9]+)")

  local WORDS=($(echo "${1}"| grep -oE "([A-z]+)"))
  local FIRST_THREE_WORDS="${WORDS[@]:1:3}"
  local FIRST_THREE_WORDS_NO_SPACES=$(echo "${FIRST_THREE_WORDS}" | sed 's/\ /_/g')
  local FIRST_THREE_WORDS_LOWER=$(echo "${FIRST_THREE_WORDS_NO_SPACES}" | tr '[:upper:]' '[:lower:]')
  local BRANCH_NAME="${JIRA_NUMBER}_${FIRST_THREE_WORDS_LOWER}"

  echo "${BRANCH_NAME}"
}

alias g="git status"
alias ga="git add"
alias gb="git branch"
alias gba="git branch -a"
alias gv="git branch -vv"
# "Short" version - limit the output toe 120 columns
alias gvs="git branch -vv | sed -e 's/\(.\{120\}\)\(.*\)/\1/g' "
alias gbd="git branch -d $1"
alias gbD="git branch -D $1"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gd="git diff"
# Stage the deletion of any files you've deleted
alias gdd="git ls-files --deleted -z | xargs -0 git rm"
alias gm="git commit -m "
alias gpu="git push"
alias gpl="git pull"
# Pretty looking git log
alias log="git log --oneline --all --graph --decorate"

# Start a pull request for the current branch
alias gpr=open "${GITHUB_HOSTNAME}/compare/$(git branch | grep \* | cut -d ' ' -f2)?expand\=1"

# Start a feature (git flow) and name the branch based on a jira description
alias gfs=gitfeaturestart
gitfeaturestart() {
  local BRANCH_NAME=$(construct_branch_name "${1}")
  git checkout -b feature/"${BRANCH_NAME}" develop
  git branch -vv
}

# Make local branch tracking remote that matches a regex
# For example gg hotfix nov-14
alias gg=gitbranchgrep
gitbranchgrep() {
  git pull && \
  git checkout -b ${1} $(git branch -a | grep ${2}) && \
  git branch -vv
}

outstanding_commits()
{
  git cherry -v develop "${1}"
}
# Show detatched commits
# alias gdc=detatched_commits
# detatched_commits() {
  # git log --oneline --all --graph --decorate  $(git reflog | awk '{print $1}')
# }
