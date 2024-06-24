{ lib, config, osConfig, ... }:
{
    config = lib.mkIf osConfig.hm.flyxx.mods.desktopApps.thunderbird.enable {
        #hm.mods.mail.enable = true;
        programs.thunderbird = {
            enable = true;
            profiles = {
                flyxx = {
                    isDefault = true;
                    settings = {
                        "extensions.activeThemeID" = "thunderbird-compact-dark@mozilla.org";
                    };
                };
            };
        };
    };
}
