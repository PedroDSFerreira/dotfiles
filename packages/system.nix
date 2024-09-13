{ pkgs ? import <nixpkgs> { }, unstablePkgs ? import <unstable> { } }:

let
  xorg = pkgs.xorg;
  kde = pkgs.kdePackages;
  jetbrains = pkgs.jetbrains;
in {
  inherit (pkgs)
    awesome blueman brave brightnessctl cargo discord docker feh gcc gimp go mpv
    networkmanagerapplet notepadqq pamixer pavucontrol picom-pijulius playerctl
    polybar postman prismlauncher python3 rofi scrot simplescreenrecorder
    spotify stremio udiskie unzip usbutils wezterm wget xclip xf86_input_wacom
    zsh obsidian;

  inherit (xorg) setxkbmap xf86inputsynaptics xset xkill xprop xrandr;

  inherit (kde) kdeconnect-kde;

  inherit (jetbrains) idea-community;

  inherit (unstablePkgs)
  ;
}
