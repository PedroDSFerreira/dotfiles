{ config, pkgs, ... }:

let
  unstablePkgs = import <unstable> { inherit (pkgs) config; };
  systemPackages = import /home/pedro/.dotfiles/packages/system.nix {
    inherit pkgs;
    inherit unstablePkgs;
  };
  cliPackages = import /home/pedro/.dotfiles/packages/cli.nix {
    inherit pkgs;
    inherit unstablePkgs;
  };
in {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./display.nix
    ./hardware-configuration.nix
    ./locale.nix
    ./network.nix
    ./services.nix
    ./users.nix
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs;
    (builtins.attrValues systemPackages) ++ (builtins.attrValues cliPackages);

  nix.gc.automatic = true;

  system.stateVersion = "24.05";
}

