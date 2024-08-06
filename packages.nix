{ pkgs ? import <nixpkgs> {} }:

{
    inherit (pkgs)
        bat
        btop
        calc
        delta
        du-dust
        eza
        fd
        ffmpegthumbnailer
        fontconfig
        fzf
        httpie
        jq
        lazydocker
        lazygit
        lf
        neovim
        nodejs_20
        ollama
        poppler
        ripgrep
        rsync
        sd
        starship
        stow
        tealdeer
        timg
        tmux
        ueberzugpp
        unar
        yazi
        zsh
        ;
}
