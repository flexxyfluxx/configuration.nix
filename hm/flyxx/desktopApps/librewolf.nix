{ lib, config, ... }:
{
    options = {
        hm.mods.desktopApps.librewolf.enable = lib.mkEnableOption "enable browser";
    };
    config = lib.mkIf config.hm.mods.desktopApps.librewolf.enable {
        programs.librewolf = {
            enable = true;
        };
    };
}
