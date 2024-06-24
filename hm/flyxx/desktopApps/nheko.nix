{ lib, config, osConfig, ... }:
{
    config = lib.mkIf osConfig.hm.flyxx.mods.desktopApps.nheko.enable {
        programs.nheko.enable = true;
    };
}
