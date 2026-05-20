#!/usr/bin/env bash
# shellcheck disable=SC1090
# shellcheck disable=SC1091

case $- in
    *i*) ;;
      *) return;;
esac

custom_path_add() {
    local new_path="$1"
    if [[ ":$PATH:" != *":$new_path:"* ]]; then
        export PATH="$PATH:$new_path"
    fi
}

custom_path_add "$HOME/.scripts"
custom_path_add "$HOME/go/bin"
custom_path_add "/usr/local/go/bin"
custom_path_add "$HOME/.local/bin"

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend globstar autocd cdspell dotglob extglob checkwinsize

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

gac() {
    args=("$@")
    message="${args[-1]}"
    if [ ! -e "$message" ]; then
        git add "${args[@]:0:${#args[@]}-1}" && git commit -m "$message"
    else
        echo "Missing commit message"
    fi
}

export EDITOR=nvim
