# ------------------------------
# STARTUP
# ------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
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
zinit ice depth=1; zinit light romkatv/powerlevel10k
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

# The meaning of these options can be found in man page of `zshoptions`.
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
alias vs="code"
alias vim="nvim"
alias configs="cd ~/.dotfiles/configs/"
alias workspace="cd ~/Desktop/Workspace"
alias ..="cd .."
alias ~="cd ~"
alias _="cd - > /dev/null"
alias cl="clear -x"
alias cat="bat"
alias find="fd"
alias l="lf"
alias ll="eza -a -l --icons -s type"
alias la="eza -a --icons -s type"
alias ls="eza --icons -s type"
alias lt="eza -T --icons -L=1"
alias ltt="eza -T --icons -L=2"
alias pac="sudo pacman"
alias stats="btop"
alias antlr4-d="docker run --rm -u $(id -u ${USER}):$(id -g ${USER}) -v `pwd`:/workspace antlr4 $@"

h() {
        history 0 | awk '{$1=""}1' | fzf-tmux -p --layout reverse --tac | zsh
}

brightness() {
        sudo xbacklight -set $1
}

# ------------------------------
# Shell integrations
# ------------------------------
# eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval $(env TERM=xterm256-color dircolors)

# Startup ascii script (shows ascii art)
# sh ~/.scripts/ascii.sh

# rust config
# . "$HOME/.cargo/env"
# ruby config
# eval "$(rbenv init - zsh)"

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
