{ config, pkgs, lib, inputs, ...}:
{

  imports = [
    ./../../home-manager/home-pkgs
    ./../../home-manager/wayland
    ./../../home-manager/terminal
    ./../../home-manager/browsers
    ./../../home-manager/small-stuff 
	
  ];

  home.username = "astor";
  home.homeDirectory = "/home/astor"; 
  
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
 
}
