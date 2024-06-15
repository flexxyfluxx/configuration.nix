{ lib, config, ... }:
{
    options = {
        hm.mods.desktopApps.thunderbird.enable = lib.mkEnableOption "enable thunderbird";
    };
    config = lib.mkIf config.hm.mods.desktopApps.thunderbird.enable {
        hm.mods.mail.enable = true;
        programs.thunderbird = {
            enable = true;
        };
    };
}
