{ config, pkgs, ... }:

let
  unstablePkgs = import <nixos-unstable> { inherit (pkgs) config; };
  systemPackages = import /home/pedro/.dotfiles/packages/system.nix { inherit pkgs; inherit unstablePkgs; };
  cliPackages = import /home/pedro/.dotfiles/packages/cli.nix { inherit pkgs; inherit unstablePkgs; };
in
{
  imports =
    [
      ./hardware-configuration.nix
      ./boot.nix
      ./users.nix
      ./display.nix
      ./network.nix
      ./audio.nix
      ./services.nix
      ./locale.nix
    ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs;
    (builtins.attrValues systemPackages) ++
    (builtins.attrValues cliPackages);

  nix.gc.automatic = true;

  system.stateVersion = "24.05";
}

