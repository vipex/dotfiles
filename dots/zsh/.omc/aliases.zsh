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
