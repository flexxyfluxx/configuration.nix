{ inputs, ... }:
{
    config = {
        nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    };
}
