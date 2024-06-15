{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-fixes.url = "github:NixOS/nixpkgs/91a7822b04fe5e15f1604f9ca0fb81eff61b4143"; # HACK: remove this soon
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        sops-nix = {
            url = "github:Mic92/sops-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        pinix = {
            url = "github:remi-dupre/pinix";
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
                    /* HACK: idek if this does anything qwq; inshallah the repos get fixed soon
                        overlays = [
                            (final: prev: {
                                nodePackages = prev.nodePackages // {
                                    inherit (inputs.nixpkgs-fixes.legacyPackages.${prev.system}.nodePackages) bash-language-server;
                                };
                            })
                        ];
                    */
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
