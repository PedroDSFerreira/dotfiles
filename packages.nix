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
        glow
        httpie
        jq
        lazydocker
        lazygit
        lf
        neovim
        nodejs_20
        ollama
        poppler_utils
        ripgrep
        rsync
        sd
        sshs
        starship
        stow
        tealdeer
        timg
        tmux
        ueberzugpp
        unar
        # yazi (outdated)
        zsh
        ;
}
