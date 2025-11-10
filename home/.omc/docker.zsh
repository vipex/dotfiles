#!/usr/bin/env zsh

alias dk="docker"
alias dki="docker images"
alias dkxxx="docker system prune -f --volumes"
alias dkr="docker run -it --rm"
alias dkc="docker-compose"
function dkrv () {
	docker run -it --rm -v "$PWD":/ws -w /ws "${@}"
}
