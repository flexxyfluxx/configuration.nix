{ lib, config, osConfig, pkgs, ... }:
{
    config = lib.mkIf osConfig.hm.neon.mods.desktopApps.librewolf.enable {
        /* programs.librewolf = {
            enable = true;
        }; */
        home.packages = with pkgs; [ librewolf ];
    };
}
