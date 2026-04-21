{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    #nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    #nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs-master.url = "github:nixos/nixpkgs";
    #nixpkgs-staging-next.url = "github:nixos/nixpkgs/staging-next";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager"; # /release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    nix-colors.url = "github:misterio77/nix-colors";

    #plasma-manager.url = "github:pjones/plasma-manager";
    #plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    #plasma-manager.inputs.home-manager.follows = "home-manager";

    #niri.url = "github:sodiboo/niri-flake";
    #niri.inputs.nixpkgs.follows = "nixpkgs";

    bing-mate.url = "github:rafameou/bing-mate";
    bing-mate.inputs.nixpkgs.follows = "nixpkgs";

    #stylix.url = "github:danth/stylix";

    img-clip-nvim.url = "github:HakonHarnes/img-clip.nvim";
    img-clip-nvim.flake = false;

    markview-nvim.url = "github:OXY2DEV/markview.nvim";
    markview-nvim.flake = false;
  };

  outputs =
    {
      nixpkgs,
      home-manager, 
      #plasma-manager,
      #niri,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        chikorita = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; }; # Pass flake inputs to our config
          modules = [
            #niri.nixosModules.niri
            #stylix.nixosModules.stylix
            ./nixos/system/chikorita.nix
          ];
        };
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; }; # Pass flake inputs to our config
          modules = [
            #niri.nixosModules.niri
            #stylix.nixosModules.stylix
            ./nixos/system/nixos.nix
          ];
        };
        treecko = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; }; # Pass flake inputs to our config
          modules = [
            #niri.nixosModules.niri
            #stylix.nixosModules.stylix
            ./nixos/system/treecko.nix
          ];
        };
	turtwig = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; }; # Pass flake inputs to our config
          modules = [
            #niri.nixosModules.niri
            #stylix.nixosModules.stylix
            ./nixos/system/turtwig.nix
          ];
        };
      };
    };
}
