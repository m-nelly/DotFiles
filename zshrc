# zshrc
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/fzf-tab/fzf-tab.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-fzf-history-search/zsh-fzf-history-search.zsh
autoload -U compinit; compinit

# Case Insensitive Path Completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

export EDITOR=nvim

# Prompt Git Indicator
setopt prompt_subst
function git_branch(){
    remote=$(git remote -v 2> /dev/null | head -n1 | awk -F'[.@]' '{print $2}')
    branch=$(git branch 2> /dev/null | cut -d ' ' -f 2)
    if [[ $remote == "github" ]]; then
        echo " $branch"
    elif [[ $remote == "gitlab" ]] then
        echo " $branch"
    elif [[ $remote != "" ]] then
        echo " $branch"
    else
        :
    fi
}

# Prompt
# Old Prompt
# PROMPT=$'%F{yellow}%B┌[%F{blue}%D{%I:%M%p}%F{yellow}]-[%F{cyan}%n@%m:%F{blue}%(6~.%-1~/…/%4~.%5~)%f%F{yellow}]\n└─%F{blue}$%F{reset}%b '
export LC_ALL=en.US.UTF-8
PROMPT=$'%B%F{black}%K{yellow} %(6~.%-1~/…/%4~.%5~) %%%F{yellow}%K{282828}%k%f%b '
RPROMPT=$'%B%F{#504945}$(git_branch)%F{reset}%b'

# PATH
if [ -d "/usr/local/go/bin" ] ; then
    PATH="$PATH:/usr/local/go/bin"
fi

if [ -d "$HOME/go/bin" ] ; then
    PATH="$PATH:$HOME/go/bin"
fi

if [ -d "$HOME/.bin" ] ; then
    PATH="$PATH:$HOME/.bin"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$PATH:$HOME/.local/bin"
fi

# Key Binding
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-

# Auto Run
fastfetch 

# Aliases 
# Builtins
alias ls='eza --group-directories-first'
alias lt="ls -T"
alias cat="bat -p"
export BAT_THEME="base16"
alias vgrep="grep -B1 -A1 --color=auto"

# Color
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

# Note Taking
alias notes="cd ~/notes"
alias vim="nvim"

# Updates
alias install="sudo pacman -Syu"
alias uninstall="sudo pacman -Runs"

# VPN
alias htb="sudo openvpn --daemon --config ~/.config/htb.ovpn"

# pnpm
export PNPM_HOME="/home/mnelly/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
