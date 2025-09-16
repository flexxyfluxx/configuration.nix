{ config, lib, pkgs, ... }:
let
    cfg = config.mods.nix-ld;
in {
    options.mods.nix-ld = {
        enable = lib.mkEnableOption "enable nix-ld";
    };
    config = lib.mkIf cfg.enable {
        programs.nix-ld = {
            enable = true;
            libraries = with pkgs; [
                libGL
                SDL2
                xorg.libX11
                alsa-lib
            ];
        };
    };
}
