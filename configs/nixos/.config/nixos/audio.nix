{ config, pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    extraConfig.client = {
      "context.properties" = {
        "module.x11.bell" = false;
      };
    };
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
  };

  security.rtkit.enable = true;
}

