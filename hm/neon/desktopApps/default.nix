{ lib, config, ... }:
{
    imports = [
        ./kitty.nix
        ./librewolf.nix
        ./signal.nix
    ];
}
