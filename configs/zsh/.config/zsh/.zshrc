# ------------------------------
# STARTUP
# ------------------------------

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# ------------------------------
# PLUGINS
# ------------------------------
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -Uz compinit && compinit

# ------------------------------
# HISTORY
# ------------------------------
export HISTFILE=~/.history
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=$HISTSIZE # maximum number of items for the history file
export HISTDUP=erase      # erase duplicates in the history file

setopt HIST_IGNORE_SPACE  # ignore commands that start with space
setopt HIST_IGNORE_ALL_DUPS  # ignore duplicated commands
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time
setopt SHARE_HISTORY  # share history among all sessions

# ------------------------------
# BINDINGS
# ------------------------------
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# ------------------------------
# COMPLETIONS
# ------------------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -a --icons -s type $realpath'

# ------------------------------
# ALIASES
# ------------------------------
alias vim="nvim"
alias configs="cd ~/.dotfiles/configs/"
alias workspace="cd ~/Workspace"
alias ..="cd .."
alias ~="cd ~"
alias _="cd - > /dev/null"
alias cl="clear -x"
alias cat="bat -p"
alias ll="eza -a -l --icons -s type"
alias la="eza -a --icons -s type"
alias ls="eza --icons -s type"
alias lt="eza -T --icons -L=1"
alias ltt="eza -T --icons -L=2"
alias webcam="mpv --profile=low-latency --untimed --no-terminal --script-opts-append=osc-visibility=never --geometry=30% /dev/video0 --title='webcam' &"

function upload-tmp() {
  curl -F "file=@$1" https://temp.sh/upload
}

function h() {
    history 0 | awk '{$1=""}1' | fzf-tmux -p --layout reverse --tac | zsh
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# ------------------------------
# Shell integrations
# ------------------------------
eval "$(starship init zsh)"
eval "$(fzf --zsh)"

# rust config
# . "$HOME/.cargo/env"
# ruby config
# eval "$(rbenv init - zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
