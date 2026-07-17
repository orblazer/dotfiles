# shellcheck shell=bash
# ? Inspired by https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/ssh-agent/ssh-agent.plugin.zsh

function _start_agent() {
  local ssh_env_cache="$HOME/.ssh/environment-${SHORT_HOST:-$HOST}"
   # Check if ssh-agent is already running
  if [[ -f "$ssh_env_cache" ]]; then
    . "$ssh_env_cache" > /dev/null

    # Test if $SSH_AUTH_SOCK is visible
    zmodload zsh/net/socket
    if [[ -S "$SSH_AUTH_SOCK" ]] && zsocket "$SSH_AUTH_SOCK" 2>/dev/null; then
      return 0
    fi
  fi

  if [[ ! -d "$HOME/.ssh" ]]; then
    echo "ssh-agent requires ~/.ssh directory"
    return 1
  fi

  # Set a maximum lifetime for identities added to ssh-agent
  local lifetime
  zstyle -s :orblazer:ssh-agent lifetime lifetime || lifetime='24h'

  # start ssh-agent and setup environment
  ssh-agent -s ${lifetime:+-t} ${lifetime} | sed '/^echo/d' >! "$ssh_env_cache"
  chmod 600 "$ssh_env_cache"
  . "$ssh_env_cache" > /dev/null
}
_start_agent

unfunction _start_agent
