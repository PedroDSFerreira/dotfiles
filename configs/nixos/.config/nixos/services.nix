{ config, pkgs, ... }:

{
  services = {
    openssh.enable = true;
    libinput.enable = true;
    udisks2.enable = true;
    resolved.enable = true;
    dbus.enable = true;
    blueman.enable = true;
  };

  programs.zsh.enable = true;
}

