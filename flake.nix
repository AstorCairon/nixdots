{
  description = "A very basic flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   
    #hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    #hyprland-plugins = {
      #url = "github:hyprwm/hyprland-plugins";
      #inputs.hyprland.follows = "hyprland";
    #};

    stylix.url = "github:danth/stylix";

    home-manager = {
     url = "github:nix-community/home-manager";
     inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, nixvim, stylix, ... }@inputs: {

    nixosConfigurations.Toaster = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86-64-linux";
      modules = [

        ./modules/configuration.nix
      
      nixvim.nixosModules.nixvim
      inputs.stylix.nixosModules.stylix
      nixos-hardware.nixosModules.focus-m2-gen1

      home-manager.nixosModules.home-manager
      {
         home-manager.useGlobalPkgs = true;
         home-manager.users.astor = import ./home-manager/home.nix;
        }
      ];
    };
  };
}
