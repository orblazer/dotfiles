# shellcheck shell=bash
#------------------
# Helpers functions
#------------------

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_";
}

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
function fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# Universal archive extractor
function ex() {
  if [[ ! -f "$1" ]]; then
    echo "'$1' is not a valid file"
    return 1
  fi
  case "$1" in
    *.tar.bz2)  tar xjf "$1"    ;;
    *.tar.gz)   tar xzf "$1"    ;;
    *.tar.xz)   tar xJf "$1"    ;;
    *.tar.zst)  tar --zstd -xf "$1" ;;
    *.bz2)      bunzip2 "$1"    ;;
    *.rar)      unrar x "$1"    ;;
    *.gz)       gunzip "$1"     ;;
    *.tar)      tar xf "$1"     ;;
    *.tbz2)     tar xjf "$1"    ;;
    *.tgz)      tar xzf "$1"    ;;
    *.zip)      unzip "$1"      ;;
    *.Z)        uncompress "$1" ;;
    *.7z)       7z x "$1"       ;;
    *.zst)      unzstd "$1"     ;;
    *)          echo "'$1' cannot be extracted via ex()" ;;
  esac
}

function killZombie() {
  kill -9 $(ps -A -ostat,ppid | grep -e '[zZ]'| awk '{ print $2 }' | uniq);
}

function startKVM() {
  sudo systemctl start libvirtd && sudo systemctl start virtlogd
}
