# Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

#let
  #dynamically include hardware-configuration.nix if it exists
 # Import hardware-configuration.nix dynamically, providing the necessary arguments
 # hardwareConfig = if builtins.pathExists ./../hardware-configuration.nix
  #                 then lib.evalModules {
    #                 modules = [ ./../hardware-configuration.nix ];
   #                  inherit config lib pkgs;
     #              }.config
      #             else {}; 
#in

{ 
 
  imports =
    [ 
      
      ./../../modules
      ./hardware-configuration.nix

    ]; # ++ (if hardwareConfig != {} then [ hardwareConfig ] else []);
 

   
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

   #USER

    users.users.astor = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      packages = with pkgs; [
        tree
      ];
    };

    #PACKAGES
  
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

  #NETWORKING

  networking.hostName = "Toaster";

  services.openssh.enable = false;
  #networking.proxy.default = "http://user:password@proxy:port/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  #some programs need SUID wrappers, can be configured further or are started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = false;
    enableSSHSupport = false;
  };

  networking.firewall = {
  enable = true;
  allowedTCPPorts = [ 80 443 587 993 995 9001 9030 9050 9051 ];
  allowedUDPPorts = [ 53 123 161 67 68 5353 ];
  allowedUDPPortRanges = [
    { from = 8000; to = 8010; }
    { from = 50000; to = 65535; } 
    #{from = 6000; to 6063; } open this range if you need remote access (such as over SSH) to X11 applications
  ];
};

    
   
  
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; 
}

