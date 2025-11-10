#!/usr/bin/env zsh

# PHP Runners
function composer () { docker run -it --rm composer:latest "${@}"; }
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

function envup () {
  if [ -f .env ]; then
    while IFS='=' read -r key value; do
      [[ "$key" =~ ^#.*$ || -z "$key" ]] && continue
      export "$key=$value"
    done < .env
  fi
}

function swagger () {
  docker run --rm -d -p 8080:8080 --name "swagger-editor" swaggerapi/swagger-editor
  open "http://localhost:8080"
}
