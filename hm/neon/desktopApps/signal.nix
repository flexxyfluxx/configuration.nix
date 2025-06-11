{ lib, config, osConfig, pkgs, ... }:
{
    config = lib.mkIf osConfig.hm.neon.mods.desktopApps.signal.enable {
        home.packages = with pkgs; [ signal-desktop ];
    };
}
