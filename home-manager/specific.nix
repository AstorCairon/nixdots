{config, lib, pkgs, inputs, ...}:
{
  home.username = "astor";
  home.homeDirectory = "/home/astor"; 
  
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
