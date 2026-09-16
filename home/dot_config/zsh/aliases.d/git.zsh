# shellcheck shell=bash
# ? Inspired by https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh

# Log
zstyle -s ':orblazer:git:log' format '_git_log_medium_format' \
    || _git_log_medium_format='%C(yellow)%h %C(green) %cr%C(red) %d%C(reset) %s%C(bold blue) <%an>%C(reset)'

# Exit if git is not installed
if (( ! $+commands[git] )); then
  return
fi

alias g='git'
alias ga='git add'
alias gc='git commit'
alias gcl='git clone'
alias grf='git reflog'

alias gp='git push'
alias gpf='git push --force-with-lease --force-if-includes'

alias grb='git rebase'
alias grba='git rebase --abort'

alias gb='git branch'
alias gsw='git switch'

alias glog='git log --pretty=format:"$_git_log_medium_format" --abbrev-commit --graph'

# Git auto squash fixup
function gaf() {
  local target="$1"
  if [ -z "$target" ]; then
    echo "Usage: gaf <commit>"
    return 1
  fi
  if ! git diff-files --quiet > /dev/null; then
    echo "Unstaged changes, please commit or stash with --keep-index"
    return 1
  fi

  local commit
  commit=$(git rev-parse "$target") || return 1

  git commit --fixup="$commit" || return 1
  git rebase -i --autosquash "${commit}~1"
}
