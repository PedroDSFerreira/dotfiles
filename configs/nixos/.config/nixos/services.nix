{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  services = {
    openssh.enable = true;
    libinput.enable = true;
    udisks2.enable = true;
    resolved.enable = true;
    dbus.enable = true;
  };

  programs.kdeconnect.enable = true;
}

