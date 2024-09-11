{ config, pkgs, ... }:

{
  services = {
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
        sessionCommands = ''
          picom &
          udiskie --tray --notify &
          nm-applet &
          blueman-applet &
          sh $HOME/.scripts/background.sh &
        '';
        lightdm.greeters.slick.enable = true;
      };
    };

    displayManager = {
      defaultSession = "none+awesome";
    };
  };
}

