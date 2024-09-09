{ lib, config, osConfig, pkgs, ... }:
{
    config = lib.mkIf osConfig.hm.flyxx.mods.desktopApps.tidal.enable {
        home.packages = with pkgs; [
            tidal-hifi
            tidal-dl
        ];
    };
}
