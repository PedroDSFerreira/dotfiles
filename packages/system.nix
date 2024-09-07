{ pkgs ? import <nixpkgs> {}, unstablePkgs ? import <nixos-unstable> {} }:

let
  xorg = pkgs.xorg;
in
{
    inherit (pkgs)
        awesome
        blueman
        brave
        brightnessctl
        discord
        docker
        feh
        networkmanagerapplet
        notepadqq
        pamixer
        pavucontrol
        picom-pijulius
        playerctl
        polybar
        rofi
        scrot
        spotify
        udiskie
        usbutils
        wezterm
        zsh
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
