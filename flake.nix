{
  description = "A very basic flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #firefox-addons = {  !!!! FIXME: !!!! this input does not work correctly! Please revisit that. Would be nice to witness nix-declared firefox addons in my life! 
     # url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      #inputs.nixpkgs.follows = "nixpkgs";
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
      system = "x86_64-linux";
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
