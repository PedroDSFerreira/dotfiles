{ pkgs ? import <nixpkgs> {}, unstablePkgs ? import <nixos-unstable> {} }:

let
  xorg = pkgs.xorg;
  kde = pkgs.kdePackages;
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
        gcc
        gimp
        networkmanagerapplet
        notepadqq
        pamixer
        pavucontrol
        picom-pijulius
        playerctl
        polybar
        postman
        rofi
        scrot
        simplescreenrecorder
        spotify
        stremio
        udiskie
        usbutils
        vlc
        wezterm
        wget
        xclip
        xf86_input_wacom
        zsh
        ;

    inherit (xorg)
        setxkbmap
        xf86inputsynaptics
        xset
        xkill
        xprop
        xrandr
        ;

    inherit (kde)
        kdeconnect-kde
        ;

    inherit (unstablePkgs)
        ;
}
