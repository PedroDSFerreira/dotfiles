function h --wraps='history' --description 'alias h=history -n 30'
  history $argv | fzf --layout reverse; 
end
