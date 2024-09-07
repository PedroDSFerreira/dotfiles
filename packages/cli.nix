{ pkgs ? import <nixpkgs> {}, unstablePkgs ? import <nixos-unstable> {} }:

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
        git
        glow
        httpie
        jq
        k9s
        lazydocker
        lazygit
        neovim
        nodejs_20
        ouch
        poppler_utils
        ripgrep
        sd
        speedtest-cli
        sshs
        starship
        stow
        tealdeer
        tmux
        ;

    inherit (unstablePkgs)
        ollama
        thokr
        yazi
        ;
}
