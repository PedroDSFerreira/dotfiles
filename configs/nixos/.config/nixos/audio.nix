{ config, pkgs, ... }:

{
  sound.enable = true;
  hardware.pulseaudio.enable = false;

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
  };

  security.rtkit.enable = true;
}

