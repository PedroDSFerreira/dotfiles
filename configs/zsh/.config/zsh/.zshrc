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

source $ZDOTDIR/plugins.zsh $plugins

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

export MANPAGER="nvim +Man!"
export BAT_THEME="Monokai Extended Origin"

# ------------------------------
# ALIASES
# ------------------------------
alias vs="code"
alias vim="nvim"
alias configs="cd ~/.dotfiles/configs/"
alias workspace="cd ~/Desktop/Workspace"
alias ..="cd .."
alias ~="cd ~"
alias cl="clear"
alias cat="bat"
alias find="fd"
alias la="eza -a --icons -s type"
alias ls="eza --icons -s type"
alias lt="eza -T --icons -L=1"
alias ltt="eza -T --icons -L=2"
alias pac="sudo pacman"
alias stats="btop"

h() {
	history $1 | fzf --layout reverse
}

brightness() {
  sh ~/.scripts/brightness.sh $1
}

# Starship
eval source <(/usr/bin/starship init zsh --print-full-init)

# Startup ascii script (shows ascii art)
# sh ~/.scripts/ascii.sh

# ruby config
export PATH="$PATH:/home/pedro/.local/share/gem/ruby/2.0.0/bin"
eval "$(rbenv init - zsh)"
