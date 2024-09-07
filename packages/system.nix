{ pkgs ? import <nixpkgs> {}, unstablePkgs ? import <nixos-unstable> {} }:

let
  xorg = pkgs.xorg;
in
{
    inherit (pkgs)
        brave
        brightnessctl
        pamixer
        wezterm
        pavucontrol
        awesome
        playerctl
        rofi
        picom-pijulius
        scrot
        notepadqq
        zsh
        docker
        discord
        spotify
        polybar
        feh
        networkmanagerapplet
        blueman
        ;

    inherit (xorg)
        xdm
        setxkbmap
        xset
        xkill
        xprop
        xrandr
        xbacklight
        ;

    inherit (unstablePkgs)
        ;
}
