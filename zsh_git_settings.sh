PROJECT_PREFIX='[a-zA-Z]+'

#########
# ALIASES 
#########
# Small ones, similar to vim key bindings
alias g="git status"
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
alias gl="git log --oneline --all --graph --decorate"

alias gba="git branch -a"
alias gvv="git branch -vv"
alias gbd="git branch -d ${1}"
alias gbD="git branch -D ${1}"
alias gcb="git checkout -b"

# Large and complicated ones
# Make local branch tracking remote that matches a regex
# For example gg hotfix nov-14
alias gg=gitbranchgrep
# Stage the deletion of any files you've deleted
alias grm="git ls-files --deleted -z | xargs -0 git rm"
# Push this branch and make a new upstream with the same name
alias gsu=gitPushAndSetMatchingUpstream
# Start a pull request for the current branch
alias gpr=gitpullrequest
# List the 5 most recently used branches
alias grb=git for-each-ref --sort=-committerdate --format='%(refname)' refs/heads  | head -5



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

gitbranchgrep() {
  git pull && \
  git checkout -b ${1} $(git branch -a | grep ${2}) && \
  git branch -vv
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

alias gv=fco_preview
fco_preview() {
  local tags branches target
  branches=$(
    git --no-pager branch --sort=-committerdate \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'") || return
  git checkout $(awk '{print $2}' <<<"$target" )
}
