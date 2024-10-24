{ config, lib, pkgs, ... }: {

  options = {
    audio.enable = 
      lib.mkEnableOption 
        "enables audio configuration";
  };

  config = lib.mkIf config.audio.enable {
    hardware.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };
}
