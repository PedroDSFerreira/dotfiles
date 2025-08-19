{ pkgs ? import <nixpkgs> { }, unstablePkgs ? import <unstable> { } }:

let
  python311 = pkgs.python311Packages;
in
{
  # CLI tools
  inherit (pkgs)
    bat
    btop
    calc
    delta
    du-dust
    duf
    dysk
    eza
    fd
    fzf
    git
    glow
    httpie
    jq
    k9s
    lazydocker
    lazygit
    neovim
    ollama
    ouch
    repgrep
    ripgrep
    sd
    sshs
    starship
    stow
    tealdeer
    thokr
    tmux;

  # File/media utilities
  inherit (pkgs)
    ffmpegthumbnailer
    fontconfig
    poppler_utils
    speedtest-cli;

  # LSPs, linters, and formatters
  inherit (pkgs)
    autoflake
    black
    clang-tools
    emmet-ls
    gofumpt
    goimports-reviser
    golines
    gopls
    isort
    lua-language-server
    marksman
    nixd
    nixfmt-classic
    nodejs_20
    prettierd
    pyright
    shfmt
    stylua;

  # Python-specific
  inherit (python311)
    flake8;

  inherit (unstablePkgs)
    yazi;
}
