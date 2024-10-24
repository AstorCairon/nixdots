{ config, lib, pkgs, ...}: {
  
  options = {
    environment.enable =
      lib.mkEnableOption
        "enable sddm, hyprland and xdg-portal";
  };

  config = lib.mkIf config.environment.enable {
    services.displayManager.sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
    };

   programs.hyprland = {
     enable = true;
      xwayland.enable = true;
     };
    
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
      ];
    };
  };
}
