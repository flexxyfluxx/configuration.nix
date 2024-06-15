{ lib, config, ... }:
{
    options = {
        mods-hm.desktopApps.librewolf.enable = lib.mkEnableOption "enable browser";
    };
    config = lib.mkIf config.mods-hm.librewolf.enable {
        programs.librewolf = {
            enable = true;
        };
    };
}
