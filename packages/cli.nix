{ pkgs ? import <nixpkgs> { }, unstablePkgs ? import <nixos-unstable> { } }:

let python311 = pkgs.python311Packages;
in {
  inherit (pkgs)
    bat btop calc delta du-dust eza fd ffmpegthumbnailer fontconfig fzf git glow
    httpie jq k9s lazydocker lazygit ouch poppler_utils ripgrep sd speedtest-cli
    sshs starship stow tealdeer tmux thokr;

  # LSP/linters/formatters
  inherit (pkgs)
    stylua prettierd autoflake isort black lua-language-server nodejs_20
    nixfmt-classic shfmt clang-tools nixd gopls emmet-ls gofumpt
    goimports-reviser golines pyright marksman;

  inherit (python311) flake8;

  inherit (unstablePkgs) neovim ollama yazi;
}
