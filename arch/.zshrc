# zshrc
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/fzf-tab/fzf-tab.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-fzf-history-search/zsh-fzf-history-search.zsh
autoload -U compinit; compinit

export EDITOR=nvim
# Prompt Version Control Indicator
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
PROMPT=$'%F{yellow}%B┌[%F{blue}%D{%I:%M%p}%F{yellow}]-[%F{cyan}%n@%m:%F{blue}%(6~.%-1~/…/%4~.%5~)%f%F{yellow}]\n└─%F{blue}$%F{reset}%b '
RPROMPT=$'%B%F{#665c54}$(git_branch)%F{reset}%b'

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
neofetch --disable gpu packages resolution kernel uptime --speed_shorthand on --cpu_cores off --distro_shorthand on --disk_percent on --colors 6 6 7 7 6 6 --bold on --ascii_colors 8 6

# Aliases
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

alias notes="cd ~/notes"

alias vim="nvim"
alias config="cd ~/nixos/"
alias update="sudo nixos-rebuild switch --flake ~/nixos/"
alias upgrade="cd ~/nixos && nix flake update && cd -"

alias ls='eza --group-directories-first'
alias lt="ls -T"
alias cat="bat -p"
export BAT_THEME="gruvbox-dark"
alias vgrep="grep -B1 -A1 --color=auto"

### VPN
alias htb="sudo openvpn --daemon --config ~/.config/htb.ovpn"
