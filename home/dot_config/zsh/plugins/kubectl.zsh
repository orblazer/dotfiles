# shellcheck shell=bash
# ? Inspired by https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/kubectl/kubectl.plugin.zsh

# Exit if kubectl is not installed
if (( ! $+commands[kubectl] )); then
  return
fi

# This command is used a LOT
alias k='kubectl'

# Apply a YML file
alias kaf='kubectl apply -f'
# Apply a kustomization directory
alias kapk='kubectl apply -k'

# Drop into an interactive terminal on a container
alias keti='kubectl exec -t -i'

# Manage configuration quickly to switch contexts between local, dev ad staging.
alias kcuc='kubectl config use-context'

# General aliases
alias kg='kubectl get'
alias kd='kubectl describe'
alias kdel='kubectl delete'
alias kge='kubectl get events --sort-by=".lastTimestamp"'

# Pod management.
alias kgp='kubectl get pods'
alias kdp='kubectl describe pods'
alias kdelp='kubectl delete pods'

# Namespace management
alias kgns='kubectl get namespaces'
alias kdns='kubectl describe namespaces'
alias kdelns='kubectl delete namespace'

# ConfigMap management
alias kgcm='kubectl get configmaps'
alias kecm='kubectl edit configmap'
alias kdcm='kubectl describe configmap'
alias kdelcm='kubectl delete configmap'

# Secret management
alias kgsec='kubectl get secret'
alias kdsec='kubectl describe secret'
alias kdelsec='kubectl delete secret'

# Deployment management.
alias kgd='kubectl get deployment'
alias kdd='kubectl describe deployment'
alias kdeld='kubectl delete deployment'

# Port forwarding
alias kpf="kubectl port-forward"

# Tools for accessing all information
alias kga='kubectl get all'

# Logs
alias kl='kubectl logs'
alias klf='kubectl logs -f'

# File copy
alias kcp='kubectl cp'

# PVC management.
alias kgpvc='kubectl get pvc'
alias kdpvc='kubectl describe pvc'
alias kdelpvc='kubectl delete pvc'

# Utility print functions
function kres() {
  kubectl annotate es "$@" force-sync=$(date +%s) --overwrite
}
function _kres() {
  setopt localoptions noaliases
  words=(kubectl annotate es "${words[@]:1}")
  CURRENT=$((CURRENT + 2))
  _kubectl
}
compdef _kres kres
