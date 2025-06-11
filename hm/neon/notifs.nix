{ lib, config, osConfig, ... }:
{
    config = lib.mkIf osConfig.hm.neon.mods.notifs.enable {
        services.mako = {
            enable = true;
        };
    };
}
