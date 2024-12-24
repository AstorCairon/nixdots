{ config, pkgs, lib, inputs, ...}:
{

  imports = [
    ./home-pkgs
    ./wayland
    ./terminal
    ./browsers
    ./small-stuff
    ./specific.nix
	
  ];
 
}
