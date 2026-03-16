#!/usr/bin/env zsh

# PHP Runners
function composer () { docker run -it -v "${PWD}":/app --rm composer:latest "${@}"; }
function php74 () { docker run -it --rm php:7.4-cli-alpine "${@}"; }
function php80 () { docker run -it --rm php:8.0-cli-alpine "${@}"; }
function php81 () { docker run -it --rm php:8.1-cli-alpine "${@}"; }
function php82 () { docker run -it --rm php:8.2-cli-alpine "${@}"; }
function php83 () { docker run -it --rm php:8.3-cli-alpine "${@}"; }
function php84 () { docker run -it --rm php:8.4-cli-alpine "${@}"; }
function php85 () { docker run -it --rm php:8.5-cli-alpine "${@}"; }
alias php="php84"

function sail () {
  if [ -x "$PWD/vendor/bin/sail" ]; then
    "$PWD/vendor/bin/sail" "${@}";
  else
    docker run -it --rm laravelsail/php83-composer "${@}";
  fi
}
function sail84 () {
  if [ -x "$PWD/vendor/bin/sail" ]; then
    "$PWD/vendor/bin/sail" "${@}";
  else
    docker run -it --rm laravelsail/php84-composer "${@}";
  fi
}

function envirox () {
  local env_file="${1:-.env}"
  if [[ ! -f "$env_file" ]]; then
    echo "${env_file} not found."
    return 1
  fi

  # Strip comment/blank lines first, then scan the value side for injection patterns:
  #   $( ... )  — command substitution
  #   ` ... `   — backtick substitution
  #   ;          — command chaining
  #   &&         — logical AND chain
  #   ||         — logical OR chain
  #   |          — pipe
  #   <(         — process substitution
  local -r INJECTION_PATTERN='=.*(\$\(|`|;|&&|\|\||\|[^|]|<\()'
  if grep -vE '^\s*(#|$)' "$env_file" | grep -qE "$INJECTION_PATTERN"; then
    echo "Warning: ${env_file} contains potentially dangerous characters."
    # Ask for confirmation before loading the file
    read -r -p "Are you sure you want to load this file? [y/N] " response
    case "$response" in
    [yY])
      echo "Loading ${env_file}..."
      ;;
    *)
      echo "Aborting."
      return 1
      ;;
    esac
  fi

  # finally load the environment variables
  set -a
  # shellcheck disable=SC1090
  source "${ENV}"
  set +a
  echo "${ENV} loaded."
}

function swagger () {
  docker run --rm -d -p 8080:8080 --name "swagger-editor" swaggerapi/swagger-editor
  open "http://localhost:8080"
}
