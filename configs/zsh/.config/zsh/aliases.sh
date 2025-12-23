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

function download-tmp() {
  url="$1"
  filename="${url##*/}"
  curl -X POST -L "$url" -o "$filename"
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
