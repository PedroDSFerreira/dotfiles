{ pkgs ? import <nixpkgs> { }, unstablePkgs ? import <unstable> { } }:

let
  xorg = pkgs.xorg;
  kde = pkgs.kdePackages;
  jetbrains = pkgs.jetbrains;
in
{
  # Applications and user tools
  inherit (pkgs)
    brave
    discord
    feh
    feishin
    gimp
    mpv
    notepadqq
    obsidian
    postman
    simplescreenrecorder
    spotify
    stremio
    wezterm;

  # Development tools
  inherit (pkgs)
    cargo
    cmake
    gcc
    gnumake
    go
    libgcc
    python3;

  # KDE and JetBrains
  inherit (kde)
    kdeconnect-kde;

  inherit (jetbrains)
    idea-community;

  # Networking and system utilities
  inherit (pkgs)
    blueman
    brightnessctl
    docker
    networkmanagerapplet
    tailscale
    tailscale-systray
    udiskie
    unzip
    usbutils
    wget
    zsh;

  # Window management and UI
  inherit (pkgs)
    awesome
    pamixer
    picom-pijulius
    playerctl
    polybar
    rofi
    scrot;

  inherit (unstablePkgs)
    wiremix;

  # Xorg related tools
  inherit (xorg)
    setxkbmap
    xkill
    xprop
    xrandr
    xset
    xf86inputsynaptics;

  inherit (pkgs)
    xclip
    xf86_input_wacom;
}
