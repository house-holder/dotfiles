hasCmd() {
    if command -v "$1" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

cd() {
	builtin cd "$@"
	if git rev-parse --git-dir &>/dev/null; then
		git fetch
	fi
}

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ..l='cd .. && ll'
alias ...l='cd ../.. && ll'
alias ....l='cd ../../.. && ll'

alias bedtime='systemctl suspend'
alias code='NVIM_APPNAME=nvim /home/kh/.local/bin/nvim-0-13-0'

alias f='find . | grep '
alias h='history | grep '

alias gp="git push"
alias gs="git status"
alias pull="git pull origin "
alias log="git log -10 --oneline --graph"
alias log20="git log -20 --oneline --graph"
alias log40="git log -40 --oneline --graph"

alias rc.nvim='nvim $HOME/.bashrc'
alias config.nvim='nvim $HOME/.config/nvim/'
alias aliases.nvim='nvim $HOME/.bash_aliases'
alias options.nvim='nvim $HOME/.config/nvim/lua/options.lua'
alias keybinds.nvim='nvim $HOME/.config/nvim/lua/keymaps.lua'

alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

alias l='eza --group-directories-first'
alias a='eza -a --group-directories-first'
alias ls='eza --group-directories-first'
alias ll='eza -lh --group-directories-first'
alias la='eza -lha --group-directories-first --icons=auto --git'

exclude='node_modules|.git|.cache|dist|build|target|__pycache__|.venv|venv'

function lt() {
    local depth="${1:-2}"
	eza --tree --icons=auto --git --group-directories-first \
		--level="$depth" -I "${exclude}" "${@:2}"
}

function lta() {
    local depth="${1:-2}"
	eza -a --long --tree --icons=auto --git --group-directories-first \
		--level="$depth" -I "${exclude}" "${@:2}"
}

alias cd.cfg.nvim='cd $HOME/.config/nvim/'
alias cd.options.nvim='cd $HOME/.config/nvim/lua/ && nvim options.lua'
alias cd.keybinds.nvim='cd $HOME/.config/nvim/lua/ && nvim keymaps.lua'

alias wx='pilot-bar-daemon switch'
