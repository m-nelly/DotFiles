# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode auto # update automatically without asking
zstyle ':omz:update' frequency 7

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

## Prompt
PROMPT=$'%F{%(#.blue.cyan)}┌──(%B%F{%(#.red.blue)}%n%(#.@.@)%m%b%F{%(#.blue.cyan)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.cyan)}]
└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '

## PATH
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

## Key Binding
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-

## Completion Features
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

## Color Prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

## Syntax Highlighting 
if [ "$color_prompt" = yes ]; then
### Disable VENV Prompt
VIRTUAL_ENV_DISABLE_PROMPT=1

### Check for Syntax Highlighting plugin
syntax_highlighting_path=''
    if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        syntax_highlighting_path="/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    elif [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]; then
        syntax_highlighting_path="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
    fi

    if [ -f $syntax_highlighting_path ]; then 
        . $syntax_highlighting_path
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
        ZSH_HIGHLIGHT_STYLES[default]=none
        ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
        ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
        ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
        ZSH_HIGHLIGHT_STYLES[path]=bold
        ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[command-substitution]=none
        ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[process-substitution]=none
        ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[assign]=none
        ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
        ZSH_HIGHLIGHT_STYLES[named-fd]=none
        ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
        ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
        ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
    fi
else
    PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~%(#.#.$) '
fi

## Auto Suggestions
auto_suggestions_path=''
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    auto_suggestions_path="/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
elif [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]; then
    auto_suggestions_path="/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
fi

if [ -f $auto_suggestions_path ]; then
    . $auto_suggestions_path
### Change Suggestion Color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#707a8c'
fi

## Auto Run
neofetch --disable gpu packages resolution kernel uptime --speed_shorthand on --cpu_cores off --distro_shorthand on --disk_percent on --colors 4 3 3 3 3 4 --bold on --ascii_colors 4 4

## ZSH Cache Directory
ZDOTDIR="~/.cache/zsh/"
ZSH_COMPDUMP="~/.cache/zsh/zcompdump/.zcompdump-anchor-5.9"

## Aliases
### Color Aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:"

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'
fi

### Tools
alias notes="cd ~/notes"
alias update="sudo apt update && sudo apt -y upgrade && sudo apt -y autoremove"
alias hosts="sudo vim /etc/hosts"
alias vim="nvim"
alias install="sudo pacman -S"
alias uninstall="sudo pacman -Runs"
alias update="sudo pacman -Syu"

### File System
alias ll="ls -l"
alias la="ls -la"

### VPN
alias htb="sudo openvpn --config '/home/mnelly/.config/htb.ovpn' --daemon"