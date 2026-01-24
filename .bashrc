#!/usr/bin/env bash
# shellcheck disable=SC1090
# shellcheck disable=SC1091
# shellcheck disable=SC2012
# shellcheck disable=SC2015

if ! command -v ls >/dev/null 2>&1; then
  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"
fi

case $- in
    *i*) ;;
      *) return;;
esac

aoc() {
    local rootpath="${HOME}/personal/aoc"
    if [[ $# -eq 0 ]] || [[ "$1" =~ ^[0-9]{4}-[0-9]{2}$ ]]; then
        if [[ $# -eq 0 ]]; then
            cd "${rootpath}" || return 1
        else
            IFS=- read -ra parts <<< "$1"
            fullPath="$rootpath/${parts[0]}/${parts[1]}"
            if [[ ! -d "$fullPath" ]]; then
                mkdir -p "$fullPath"
            fi
            cd "$fullPath" || return 1
        fi
    else
        ${HOME}/.scripts/aoc "$@"
    fi
}

commas() {
    sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta'
}

custom_path_add() {
    local new_path="$1"
    if [[ ":$PATH:" != *":$new_path:"* ]]; then
        export PATH="$PATH:$new_path"
    fi
}

custom_path_add "$HOME/.scripts"

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend globstar autocd cdspell dotglob extglob checkwinsize

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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

FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  if command -v fnm >/dev/null 2>&1; then
    eval "$(fnm env --shell bash)"
  fi
fi

. "$HOME/.cargo/env"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

gac() {
    args=("$@")
    message="${args[-1]}"

    if [ ! -e "$message" ]; then
        git add "${args[@]:0:${#args[@]}-1}" && git commit -m "$message"
    else
        echo "Missing commit message"
    fi
}

nginx-edit() {
    if [ -z "$1" ]; then
        echo "Usage: nginx-edit <site-name>"
        echo "Available sites:"
        ls /etc/nginx/sites-available/ 2>/dev/null | sed 's/^/  /'
        return 1
    fi

    local site_file="/etc/nginx/sites-available/$1"

    if [ ! -f "$site_file" ]; then
        echo "Error: $site_file does not exist"
        echo "Available sites:"
        ls /etc/nginx/sites-available/ 2>/dev/null | sed 's/^/  /'
        return 1
    fi

    echo "Editing nginx config for: $1"
    sudo /usr/bin/nvim/ +'set ft=nginx' "$site_file"

    read -p "Test nginx config and reload? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo nginx -t && sudo systemctl reload nginx
    fi
}

function _nginx_edit_completion() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local -a sites
    mapfile -t sites < <(find /etc/nginx/sites-available/ -maxdepth 1 -type f -printf '%f\n' 2>/dev/null)
    COMPREPLY=("$(compgen -W "${sites[*]}" -- "$cur")")
}

complete -F _nginx_edit_completion nginx-edit

custom_path_add "$HOME/.config/zigvm/current"
custom_path_add "$HOME/go/bin"
custom_path_add "/usr/local/go/bin"
custom_path_add "/home/kh/.opencode/bin"

export EDITOR=nvim
export BAT_THEME="Nord"

learn() {
    cd ~/personal/learn/"$1" || return
}

eval "$(starship init bash)"
