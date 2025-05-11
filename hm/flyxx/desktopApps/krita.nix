{ lib, config, osConfig, pkgs, ... }:
{
    config = lib.mkIf osConfig.hm.flyxx.mods.desktopApps.krita.enable {
        home.packages = with pkgs; [ krita ];
    };
}
