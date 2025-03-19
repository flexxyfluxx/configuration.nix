{ lib, config, ... }:
{
    imports = [
        ./librewolf.nix
        ./nheko.nix
        ./kitty.nix
        ./krita.nix
        ./signal.nix
        ./thunderbird.nix
        ./tidal.nix
    ];
}
