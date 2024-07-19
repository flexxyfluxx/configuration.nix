{ config, lib, pkgs, ... }:
{
    options.mods = {
        ld.enable = lib.mkEnableOption "enable dynamic linking compat";
    };
    config = lib.mkIf config.mods.ld.enable {
        programs.nix-ld = {
            enable = true;
            libraries = with pkgs; [
            ];
        };
    };
}
