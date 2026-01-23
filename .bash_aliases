hasCmd() {
    if command -v "$1" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ..l='cd .. && ll'
alias ...l='cd ../.. && ll'
alias ....l='cd ../../.. && ll'
alias f='find . | grep '
alias h='history | grep '

alias gp="git push"
alias gs="git status"
alias pg="git pull origin "
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
alias lt='eza --tree --long --level=3 --group-directories-first \
	--icons --git -I ".git"'
alias lta='eza -a --tree --long --level=3 --group-directories-first \
	--icons --git -I ".git"'

alias cd.cfg.nvim='cd $HOME/.config/nvim/'
alias cd.options.nvim='cd $HOME/.config/nvim/lua/ && nvim options.lua'
alias cd.keybinds.nvim='cd $HOME/.config/nvim/lua/ && nvim keymaps.lua'

if hasCmd 'batcat'; then
	alias cat='batcat'
else
	echo "Command 'batcat' unavailable"
fi

if hasCmd 'pydf'; then
    alias df='pydf'
else
    echo "Command 'pydf' unavailable: check ~./bash_aliases"
fi

# if hasCmd 'eza'; then
# 	alias l='eza --group-directories-first'
# 	alias a='eza -a --group-directories-first'
# 	alias ls='eza --group-directories-first'
# 	alias ll='eza -lh --group-directories-first'
# 	alias la='eza -lha --group-directories-first --icons=auto --git'
# 	alias lt='eza --tree --long --level=3 --group-directories-first \
# 		--icons --git -I ".git"'
# 	alias lta='eza -a --tree --long --level=3 --group-directories-first \
# 		--icons --git -I ".git"'
# 	alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
# else
#     echo "Command 'eza' unavailable"
# fi

