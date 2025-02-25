{ lib, config, ... }:
{
    imports = [
        ./librewolf.nix
        ./nheko.nix
        ./kitty.nix
        ./signal.nix
        ./thunderbird.nix
        ./tidal.nix
    ];
}
