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

function git_branch() {
  local remote branch git_logo

  # Check if inside a Git repo
  if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    return
  fi

  remote=$(git remote get-url origin 2>/dev/null)
  branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)

  # Determine the logo
  if [[ "$remote" == *"github.com"* ]]; then
    git_logo=" "  # GitHub
  elif [[ "$remote" == *"gitlab.com"* ]]; then
    git_logo=" "  # GitLab
  elif [[ "$remote" == *"bitbucket.org"* ]]; then
    git_logo=" "  # Bitbucket
	elif [[ -n "$remote" ]]; then
    git_logo=" "  # Generic Git
  fi

  # Output with formatting if logo was set
  if [[ -n "$git_logo" ]]; then
    echo "%F{cyan}%K{cyan}%F{black} ${git_logo} ${branch} "
  fi
}

# Prompt
export LC_ALL=en_US.UTF-8
PROMPT=$'%B%F{black}%K{cyan} %(6~.%-1~/…/%4~.%5~) %% %F{cyan}%K{reset}%k%f%b '
RPROMPT=$'%B$(git_branch)%F{reset}%b'

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
fastfetch && colors

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
