{ lib, config, osConfig, pkgs, ... }:
{
    config = lib.mkIf osConfig.hm.flyxx.mods.desktopApps.krita.enable {
        /* programs.librewolf = {
            enable = true;
        }; */
        home.packages = with pkgs; [ krita ];
    };
}
