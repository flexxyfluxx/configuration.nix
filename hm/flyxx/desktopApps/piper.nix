{ lib, config, osConfig, pkgs, ... }:
{
    config = lib.mkIf osConfig.hm.flyxx.mods.desktopApps.piper.enable {
        home.packages = with pkgs; [ piper ];
    };
}
