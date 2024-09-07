{ pkgs ? import <nixpkgs> {}, unstablePkgs ? import <nixos-unstable> {} }:

let
  xorg = pkgs.xorg;
  kde = pkgs.kdePackages;
in
{
    inherit (pkgs)
        awesome
        simplescreenrecorder
        vlc
        gimp
        postman
        stremio
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
