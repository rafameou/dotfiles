{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs";
    nixpkgs-staging-next.url = "github:nixos/nixpkgs/staging-next";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager"; #/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    nix-colors.url = "github:misterio77/nix-colors";

    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    #chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      bulbasaur = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; }; # Pass flake inputs to our config
        modules = [ ./nixos/bulbasaur.nix ];
      };
      chikorita = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; }; # Pass flake inputs to our config
        modules = [ 
          ./nixos/chikorita.nix 
          #chaotic.nixosModules.default
        ];
      };
      treecko = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; }; # Pass flake inputs to our config
        modules = [ ./nixos/treecko.nix ];
      };
      oddish = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; }; # Pass flake inputs to our config
        modules = [ ./nixos/oddish.nix ];
      };
    };
  };
}
