{ lib, config, ... }:
{
    imports = [
        ./kitty.nix
        ./krita.nix
        ./librewolf.nix
        ./nheko.nix
        ./piper.nix
        ./signal.nix
        ./thunderbird.nix
        ./tidal.nix
    ];
}
