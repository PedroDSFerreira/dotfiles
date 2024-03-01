{ pkgs ? import <nixpkgs> {} }:

{
    inherit (pkgs)
        bat
        btop
        calc
        delta
        eza
        fd
        fontconfig
        fzf
        jq
        lazydocker
        lazygit
        lf
        man-db
        man-pages
        neovim
        nodejs_20
        ollama
        ripgrep
        rsync
        starship
        stow
        tealdeer
        timg
        tmux
        unar
        zsh
        ;
}
