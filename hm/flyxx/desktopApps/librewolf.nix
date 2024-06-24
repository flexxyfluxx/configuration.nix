{ lib, config, osConfig, ... }:
{
    config = lib.mkIf osConfig.hm.flyxx.mods.desktopApps.librewolf.enable {
        programs.librewolf = {
            enable = true;
        };
    };
}
