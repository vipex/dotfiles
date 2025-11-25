# ~/.dotfiles

This repository contains my personal dotfiles and configuration files for various applications and tools.
Feel free to explore and use them as a reference for your own setup!

## Manual Setup

Here the links to some applications that's better install manually and are prerequisites for some configurations.

- [1Password](https://1password.com/downloads/)
- [Bitdefender](https://central.bitdefender.com/)

## Content

- `bootstrap` - The main setup script to initialize the dotfiles and configurations.
- `home/` - Contains the actual dotfiles and configuration files to be symlinked to the home directory.
- `macos/` - MacOS specific configurations and installation scripts.
-

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

> TBD
