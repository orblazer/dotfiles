# Dotfiles Repository

This repository contains my personal dotfiles managed using [chezmoi](https://www.chezmoi.io/). Chezmois is a tool for managing dotfiles across multiple machines securely and efficiently.

> [!NOTE]
>
> This is highly inspired by [sebtiz13/dotfiles](https://github.com/sebtiz13/dotfiles) repository.

## Getting Started

### Prerequisites

- `curl` or `wget` (for installing chezmoi)
- `git` (for cloning this repository)

### Installation

To set up your environment using these dotfiles, run the following command:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --purge-binary orblazer
```

Or, if you prefer using `wget`:

```sh
sh -c "$(wget -qO- get.chezmoi.io)" -- init --apply --purge-binary orblazer
```

### Manual Installation

Alternatively, you can manually install chezmoi and apply the dotfiles:

1. Install chezmoi:

   ```sh
   sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin
   ```

2. Clone this repository and apply the dotfiles:
   ```sh
   chezmoi init --apply --purge-binary orblazer
   ```

## Environment Setup

This setup includes:

- **ZSH Shell**: A powerful shell with advanced features
- **Sheldon**: A fast and configurable plugin manager for ZSH
- **Powerlevel10k**: A customizable prompt for ZSH
- **FZF**: A fuzzy finder for command-line
- **Mise**: A polyglot runtime manager
- **Bitwarden**: Secure secrets (eg. SSH keys, GPG keys) management
- **lessfilter**: A custom filter for `less` to enhance file preview using `eza`, `bat`, and `exiftool`. This is particularly useful for `fzf-tab` preview

### Sheldon Plugins

The following plugins are managed by Sheldon:

- **zsh-defer**: Deferred initialization for faster shell startup
- **zsh-autoswitch-virtualenv**: Automatically switch virtual environments
- **powerlevel10k**: Pretty cool customizable prompt
- **fzf-tab**: Fuzzy tab completion with enhanced preview using `lessfilter`
- **fast-syntax-highlighting**: Syntax highlighting
- **zsh-history-substring-search**: History substring search
- **zsh-autosuggestions**: Command suggestions
- **zsh-completions**: Additional completions
- **fzf**: Fuzzy finder
- **ssh-agent**: SSH agent management
- **zsh-ssh**: SSH utilities

### Mise Tools

The following tools are managed by Mise:

- **chezmoi**: Manage dotfiles across multiple machines
- **flux2**: GitOps tool for Kubernetes
- **kubectl**: Kubernetes command-line tool
- **mise-completions-sync**: Synchronize shell completions for mise
- **shellcheck**: Shell script analysis tool

#### Shell Completion

The `mise-completions-sync` tool is used to synchronize shell completion for the mise tool. This ensures that shell completions for tools managed by mise are automatically updated and available in the shell.

### Package Installation

Packages defined in `home/.chezmoidata/packages.yaml` are automatically installed using the script `home/.chezmoiscripts/run_once_before_01-install-packages.sh.tmpl`.
For Manjaro this script enables AUR on pamac, updates sources, and installs the specified packages.

### VSCodium Configuration

VSCodium extensions defined in `home/.chezmoidata/vscodium.yaml` are automatically installed using the script `home/.chezmoiscripts/run_onchange_after_03-configure-vscodium.sh.tmpl`. This script installs the specified extensions using the VSCodium CLI.

### Bitwarden Integration

This setup uses Bitwarden to securely store and manage secrets like SSH keys, GPG keys, and other sensitive information.
During setup, chezmoi will prompt for Bitwarden server information and unlock credentials to securely retrieve these secrets.

## Dotfiles Structure

- `.config/`: Configuration files for various applications
  - `environment.d/`: Directory for environment variables in `*.conf` files
  - `git/`: Git configuration directory
    - `hooks/executable_commit-msg`: Git hook for [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/)
    - `config.tmpl`: Git configuration template
  - `mise/config.toml`: Mise configuration
  - `npm/.npmrc` / `pnpm/rc`: (P)NPM config for conventional commits on release.
  - `sheldon/plugins.toml`: Sheldon plugin manager configuration
  - `zsh/`: Custom ZSH configurations
    - `aliases.d/`: Directory command aliases in `*.zsh` files
    - `completions/`: Directory custom command completions
    - `plugins/`: Directory for zsh plugins
      - `fzf-tab.zsh`: FZF-tab configurations
      - `kubectl.zsh`: kubectl alias
      - `p10k.zsh`: Powerlevel10k configurations
      - `ssh-agent.zsh`: ssh-agent helper (loaded by sheldon with zsh-defer)
    - `sources/`: Directory for custom fzf-tab sources
      - `command.zsh`: Custom command source
      - `tldr.zsh`: TLDR pages source
    - `.zprofile`: Zsh profile configuration
    - `.zshenv`: Zsh environment configuration
    - `.zshrc`: Zsh runtime configuration
    - `functions.zsh`: Helper functions
- `.ssh/`: SSH configuration
  - `config.d`: Directory for SSH configuration environments in `*.conf` files
  - `config`: SSH client configuration
  - SSH keys are managed via Bitwarden CLI
- `.chezmoi.yaml.tmpl`: Chezmoi configuration template
- `.fdignore`: Ignore some folders from `fd` command
- `.lessfilter`: Custom filter for `less` to enhance file preview using `eza`, `bat`, and `exiftool`
- `.profile`: Load environment variables from `.config/environment.d/*.conf`
- `.zshenv`: Define ZDOTDIR and source `.config/zsh/.zshenv`

## Resources

- [Chezmoi Documentation](https://www.chezmoi.io/docs/)
- [Chezmoi GitHub Repository](https://github.com/twpayne/chezmoi)
