{
  description = "A very basic flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland-qtutils = { 
      url = "github:hyprwm/hyprland-qtutils";
      inputs.nixpkgs.follows = "nixpkgs";
   };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {   
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    home-manager = {
     url = "github:nix-community/home-manager";
     inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, nixvim, stylix, firefox-addons, ... }@inputs: {

    nixosConfigurations = { 
      Toaster = 
      nixpkgs.lib.nixosSystem {  
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [

        ./hosts/Toaster/configuration.nix
      
      nixvim.nixosModules.nixvim
      inputs.stylix.nixosModules.stylix
      nixos-hardware.nixosModules.focus-m2-gen1

      home-manager.nixosModules.home-manager
      {
         home-manager.useGlobalPkgs = true;
         home-manager.users.astor = import ./hosts/Toaster/home.nix;
	 

        }
       ];
      };

    Microwave = 
      
      nixpkgs.lib.nixosSystem { 
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [

        ./hosts/Microwave/configuration.nix
      
      nixvim.nixosModules.nixvim
      inputs.stylix.nixosModules.stylix
      nixos-hardware.nixosModules.focus-m2-gen1

      home-manager.nixosModules.home-manager
      {
         home-manager.useGlobalPkgs = true;
         home-manager.users.astor = import ./hosts/Microwave/home.nix;
	 

        }
       ];

      
    };
  };
 };
}
