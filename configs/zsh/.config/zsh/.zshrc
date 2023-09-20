# ------------------------------
plugins=(
  jeffreytse/zsh-vi-mode
  zsh-users/zsh-completions
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-history-substring-search
  hlissner/zsh-autopair
  # must be last
  zdharma/fast-syntax-highlighting
)

source $ZDOTDIR/plugins.zsh $plugins

unset plugins
# ------------------------------

export MANPAGER="nvim +Man!"

# ALIASES
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
