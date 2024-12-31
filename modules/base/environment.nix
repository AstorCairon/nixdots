{ config, lib, pkgs, qtPLuginPackages, ...}: {
  
  options = {
    environment.enable =
      lib.mkEnableOption
        "enable sddm, hyprland and xdg-portal";
  };

  config = lib.mkIf config.environment.enable {
    services.displayManager.sddm = {
      enable = true;
      package = pkgs.sddm;
       extraPackages = [pkgs.sddm-sugar-dark];
      theme = "sugar-dark";
    };

   environment.etc."sddm/themes/sugar-dark".source = "/nix/store/jh8k6j3cxi8n35n8g1l8jmk87fm69b5l-sddm-sugar-dark-1.2/share/sddm/themes/sugar-dark";

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
