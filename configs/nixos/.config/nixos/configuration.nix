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
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 2;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Lisbon";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };

  services = {
    openssh.enable = true;
    libinput.enable = true;

    displayManager = {
      defaultSession = "none+awesome";
    };

    xserver = {
      enable = true;
      xkb.layout = "pt";
      xkb.variant = "";

      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks
          luadbi-mysql
        ];
      };

      displayManager = {
        startx.enable = true;
      };
    };

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
  };

  console.keyMap = "pt-latin1";
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  programs.zsh.enable = true;
  services.blueman.enable = true;

  users.users.pedro = {
    isNormalUser = true;
    description = "Pedro Ferreira";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  # Include imported packages from apps.nix
  environment.systemPackages = with pkgs; [
    xclip
    wget
    gcc
  ] ++ (builtins.attrValues systemPackages) ++ (builtins.attrValues cliPackages);  # Adding the custom packages

  environment.etc = {
    "profile.local".text = ''
      # /etc/profile.local: DO NOT EDIT -- this file has been generated automatically.
      if [ -f "$HOME/.profile" ]; then
        . "$HOME/.profile"
      fi
    '';
  };
  # services.kdeconnect = {
  #   enable = true;
  # };
  #
  # networking.firewall = {
  #   enable = true;
  #   allowedTCPPortRanges = [
  #     { from = 1714; to = 1764; } # KDE Connect
  #   ];
  #   allowedUDPPortRanges = [
  #     { from = 1714; to = 1764; } # KDE Connect
  #   ];
  # };
  #
  # systemd.user.services.kdeconnect = {
  #   Unit = {
  #     Description = "Adds communication between your desktop and your smartphone";
  #     After = [ "graphical-session-pre.target" ];
  #     PartOf = [ "graphical-session.target" ];
  #   };
  #
  #   Install = { WantedBy = [ "graphical-session.target" ]; };
  #
  #   Service = {
  #     Environment = "PATH=${config.home.profileDirectory}/bin";
  #     ExecStart = "${pkgs.plasma5Packages.kdeconnect-kde}/bin/kdeconnectd";
  #     Restart = "on-abort";
  #   };
  # };

  nix.gc.automatic = true;

  system.stateVersion = "24.05";
}

