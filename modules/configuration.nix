# Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

let
  #dynamically include hardware-configuration.nix if it exists
  hardwareConfig = if builtins.pathExists ./../hardware-configuration.nix
                   then import ./../hardware-configuration.nix
                   else {};
in

{
  imports =
    [ 
      
      ./base/locale.nix
      ./base/environment.nix
      ./base/audio.nix
      ./base/user.nix
      ./base/syspkgs.nix
      ./hardware/bootloader.nix
      ./base/networking.nix 
      ./base/theming.nix
      ./base/nixvim.nix
      ./hardware/gaming.nix
    ] ++ [ hardwareConfig ];

    
  audio.enable = true;
  environment.enable = true;
  environment.variables.EDITOR = "neovim";

  services.tlp.enable = true;

  nixpkgs.config.allowUnfree = true;
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  time.timeZone = "Europe/Amsterdam";

   services.xserver.enable = true;
   services.printing.enable = true;
   services.libinput.enable = true;
  
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; 
}

