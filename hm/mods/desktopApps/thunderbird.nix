{ lib, config, ... }:
{
    options = {
        mods-hm.desktopApps.thunderbird.enable = lib.mkEnableOption "enable thunderbird";
    };
    config = lib.mkIf config.mods-hm.desktop.thunderbird.enable {
        mods-hm.mail.enable = true;
        programs.thunderbird = {
            enable = true;
        };
    };
}
