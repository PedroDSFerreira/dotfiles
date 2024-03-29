# ------------------------------
# PLUGINS
# ------------------------------
plugins=(
  jeffreytse/zsh-vi-mode
  zsh-users/zsh-completions
  zsh-users/zsh-autosuggestions
  hlissner/zsh-autopair
  # must be last
  zdharma/fast-syntax-highlighting
)

source $SCRIPTS_DIR/zsh_plugins.zsh $plugins

unset plugins

# ------------------------------
# HISTORY
# ------------------------------
export HISTFILE=~/.history
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

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
alias cl="clear"
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

h() {
        history 0 | awk '{$1=""}1' | fzf-tmux -p --layout reverse --tac | zsh
}

brightness() {
        sudo xbacklight -set $1
}

# Starship
eval "$(starship init zsh)"

# Startup ascii script (shows ascii art)
# sh ~/.scripts/ascii.sh

# rust config
# . "$HOME/.cargo/env"
# ruby config
# eval "$(rbenv init - zsh)"
