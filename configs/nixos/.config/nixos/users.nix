{ config, pkgs, ... }:

{
  users.groups.pedro = {};
  users.users.pedro = {
    isNormalUser = true;
    description = "Pedro Ferreira";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    group = "pedro";
  };

  systemd.tmpfiles.rules = [
    "d /home/pedro/Workspace 0755 pedro pedro -"
    "d /home/pedro/Pictures/Screenshots 0755 pedro pedro -"
    "d /home/pedro/Videos/Recordings 0755 pedro pedro -"
  ];
}

