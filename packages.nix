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
        k9s
        lazydocker
        lazygit
        lf
        neovim
        nodejs_20
        ollama
        ouch
        poppler_utils
        ripgrep
        sd
        sshs
        starship
        stow
        tealdeer
        tmux
        # yazi (outdated)
        ;
}
