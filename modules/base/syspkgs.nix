{ config, lib, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    neovim
    wget
    curl
    git
    sddm
    gparted
  ];
}
