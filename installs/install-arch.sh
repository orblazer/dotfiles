#!/usr/bin/env bash
function installer() {
  sudo pamac install --no-confirm $@
}

function install::dependencies() {
    installer curl zsh oh-my-zsh zsh-theme-powerlevel10k nerd-fonts-noto-sans-mono git unzip fzf tree git-delta-bin
}

function install::shell() {
    for testUser in $USER root; do
        currentShell=$(getent passwd $testUser | awk -F: '{print $NF}')
        [ ! "$currentShell" == "$(which zsh)" ] && sudo usermod -s $(which zsh) $testUser
    done
}
