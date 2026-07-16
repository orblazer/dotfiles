# shellcheck shell=bash

# Mise
if (( $+commands[mise] )); then
  eval "$(mise completion zsh)"
fi
