#!/usr/bin/env zsh

# Aliases
alias ll="ls -lAhGF"
alias l="ls -lhGF"

alias ds-store-cleanup="find . -name .DS_Store -type f -delete"
alias dig="dig +noall +answer +multiline"

# Tools
function rdap () { docker run -it --rm "ghcr.io/jauderho/rdap" "${@}"; }
function x() {
  local runner="${RUNNER:-xenv}"
  if [ -x "./${runner}" ]; then
    "./${runner}" "$@"
  else
    # find the nearest xenv in parent directories until home or root
    local dir="${PWD}"
    while [ "${dir}" != "/" ] && [ "$dir" != "${HOME}" ]; do
      if [ -x "${dir}/${runner}" ]; then
        "${dir}/${runner}" "$@"
        return
      fi
      dir=$(dirname "${dir}")
    done
    echo "No runner (${runner}) found in current or parent directories."
  fi
}

# Update & Upgrade utilities
alias nodu="nvm install --lts --latest-npm"
function bruu() {
  titlez "Brew: doctor, missing, update & upgrade brews and casks and cleanup"

  # Brew diagnostic
  brew doctor
  brew missing

  # Brew update & upgrade
  brew update
  brew upgrade
  brew upgrade --cask

  # Brew cleanup
  brew cleanup -s
}

