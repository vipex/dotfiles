# ~/.dotfiles

This repository contains my personal dotfiles and configuration files for various applications and tools.
Feel free to explore and use them as a reference for your own setup.

More likely, give me feedbacks and suggestions to improve it.

## Manual Setup

Here the links to some applications that's better install manually and are prerequisites for some configurations.

- Password manager: [1Password](https://1password.com/downloads/)
- Antimalware software: [Bitdefender](https://central.bitdefender.com/)

## Setup Instructions

Start by cloning this repository to your home directory:

```bash
git clone https://github.com/vipex/dotfiles.git ~/.dotfiles
```

Then simply run the bootstrap script to set up the system with my preferred configurations:

```bash
cd ~/.dotfiles && ./bootstrap
```

### Customizations

Generic variables:
- `DOT_HOSTNAME` - Hostname to change it system-wide.
- `ZSH` - Oh My Zsh installation path (default `${HOME}/.omz`).

Stow (stow-helper) specific variables:
- `DOT_STOW_SOURCE` - Alternative source for dotfiles repository (default `./dots`).
- `DOT_STOW_TARGET` - Alternative target directory for dotfiles (default `${HOME}`).

MacOS specific variables:
- `BREWFILE` - Path to the Brewfile for Homebrew [bundle](https://docs.brew.sh/Brew-Bundle-and-Brewfile) installations.
- `MASFILE`  - Path to the MAS file for Mac App Store applications.

## Contents

- `bootstrap` - Where the magic happens, a.k.a. main setup script.
- `dots/` - Directory containing the actual dotfiles organized in subdirectories for each application.
- `linux/` - Linux-specific setup scripts and configurations (not yet implemented).
- `macos/` - MacOS-specific setup scripts and configurations.
  - `bootstrap` - Again, MacOS-specific setup script.
  - `defaults` - Script to apply MacOS system defaults.
  - `LaunchAgents/` - Directory containing plist files to be setup at startup, will be symlinked to `~/Library/LaunchAgents/`.
  - `Brewfile` - Homebrew bundle file for installing packages and applications.
  - `Masfile` - List of Mac App Store applications to be installed via `mas` (not yet implemented).
- `stow-helper` - Helper script to manage dotfiles using GNU Stow.
