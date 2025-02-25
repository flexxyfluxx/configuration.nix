{ lib, config, osConfig, pkgs, ... }:
{
    config = lib.mkIf osConfig.hm.flyxx.mods.desktopApps.signal.enable {
        home.packages = with pkgs; [ signal-desktop ];
    };
}
