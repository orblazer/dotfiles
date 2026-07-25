# shellcheck shell=bash
if [[ -o interactive ]]; then
  export GPG_TTY=$(tty)
  gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1 || true
fi
