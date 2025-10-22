# non-interactive bailout
[[ $- != *i* ]] && return

# history control
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth
shopt -s histappend checkwinsize globstar

if ! shopt -oq posix; then
  for f in /usr/share/bash-completion/bash_completion /etc/bash_completion; do
    [[ -f $f ]] && source "$f" && break
  done
fi

for d in "$HOME/bin" "$HOME/.scripts"; do
  case ":$PATH:" in
  *":$d:"*) ;;
  *) [ -d "$d" ] && PATH="$d:$PATH" ;;
  esac
done

# Fast Node Manager check & load
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ] && command -v fnm >/dev/null 2>&1; then
  PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --shell bash)"
fi
# Modular Bash Config ======================================================
CFG="$HOME/.dotfiles/.local/bash/"

# NOTE: these are segregated and hardlined in .dotfiles due to the circular
# referencing created by trying to symlink them into .config/bash/ originally
for file in functions prompt aliases; do
  if [[ -f "$CFG/$file" ]]; then
    if ! source "$CFG/$file"; then
      echo "WARNING: failure to source $file (skipping)"
    fi
  fi
done

export EDITOR=nvim
export PATH

# ==========================================================================
# WARNING: this line begins all scripted auto-adds to the file; EDIT CAREFULLY

# generated for envman (go-related)
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
