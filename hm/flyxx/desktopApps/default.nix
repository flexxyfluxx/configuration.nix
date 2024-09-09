{ lib, config, ... }:
{
    imports = [
        ./librewolf.nix
        ./nheko.nix
        ./kitty.nix
        ./thunderbird.nix
        ./tidal.nix
    ];
}
