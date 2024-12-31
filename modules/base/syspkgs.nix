{ config, lib, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    
    neovim
    wget
    curl
    git
    sddm
    gparted
    #sddm-astronaut
    sddm-sugar-dark
    qt5.qtgraphicaleffects
  ];
    
}
