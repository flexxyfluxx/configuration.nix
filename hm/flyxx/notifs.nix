{ lib, config, osConfig, ... }:
{
    config = lib.mkIf osConfig.hm.flyxx.mods.notifs.enable {
        services.mako = {
            enable = true;
        };
    };
}
