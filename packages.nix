{ pkgs ? import <nixpkgs> {} }:

{
    inherit (pkgs)
        bat
        btop
        delta
        eza
        fd
        fontconfig
        fzf
        jq
        lazygit
        lf
        man-db
        man-pages
        neovim
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
