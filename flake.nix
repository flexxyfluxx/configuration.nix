{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        /* sops-nix = {
            url = "github:Mic92/sops-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        }; */
        pinix = {
            url = "github:remi-dupre/pinix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nur = {
            url = "github:nix-community/NUR";
        };
        stylix = {
            url = "github:danth/stylix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, nixvim, sops-nix, pinix, ... }@inputs:
        let
            mkSystem = { hostname, arch }: nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                system = "${arch}";
                pkgs = import nixpkgs {
                    system = "${arch}";
                    config.allowUnfree = true;
                    overlays = [
                        inputs.nur.overlays.default
                    ];
                };
                modules = [
                    ./hosts/${hostname}/configuration.nix
                    ./hosts/${hostname}/hardware-configuration.nix
                    ./mods
                    ./hm
                    home-manager.nixosModules.home-manager
                    nixvim.nixosModules.nixvim

                    #sops-nix.nixosModules.sops
                    {
                        networking.hostName = "${hostname}";
                    }
                ];
            };
        in {
            nixosConfigurations = {
                flyxxpad = mkSystem { hostname = "flyxxpad"; arch = "x86_64-linux"; };
                flyxxtop = mkSystem { hostname = "flyxxtop"; arch = "x86_64-linux"; };
            };
        };
}
