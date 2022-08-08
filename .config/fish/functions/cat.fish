function cat --description 'alias cat=bat'
  set var test (string split . $argv)[-1] = "md"
  if $var
    glow $argv
  else
    bat $argv
  end
end
