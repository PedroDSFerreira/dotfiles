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
          blueman-applet &
          kdeconnect-indicator &
          nm-applet &
          ollama serve &
          picom &
          sh $HOME/.scripts/background.sh &
          udiskie --tray --notify &
        '';
        lightdm.greeters.slick.enable = true;
      };
    };

    displayManager = {
      defaultSession = "none+awesome";
    };
  };
}

