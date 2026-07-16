# shellcheck shell=bash
#------------------
# Improve default commands
#------------------
alias grep='rg --color=auto'
alias diff='diff --color=auto'

# confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'

# human-readable sizes
alias df='df -h'
alias free='free -h'
alias du='du -h'

# Add timestamps to history
alias history="fc -t '$HISTTIMEFORMAT' -l 1"

#------------------
# Replace commands
#------------------
# Replace ls by eza
if [ -x "$(command -v eza)" ]; then
  alias ls='eza $(printf $EZA_OPTIONS)'
  alias l='eza $(printf $EZA_OPTIONS)'
  alias la='eza -la $(printf $EZA_OPTIONS)'
  alias ll='eza -l $(printf $EZA_OPTIONS)'
fi

# Replace cat by bat# Replace cat by bat
[[ -x "$(command -v bat)" ]] && alias cat='bat -p --no-pager' # BAT https://github.com/sharkdp/bat
if [ -x "$(command -v jaq)" ]; then
  # If jaq is installed but not jq, alias jq to jaq
  [[ ! -x "$(command -v jq)" ]] && alias jq='jaq' # JAQ https://github.com/01mf02/jaq
  # If jaq is installed but not yq, alias yq to jaq
  [[ ! -x "$(command -v yq)" ]] && alias yq='jaq' # JAQ https://github.com/01mf02/jaq
fi
