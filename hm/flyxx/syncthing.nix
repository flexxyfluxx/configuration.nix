{ lib, config, osConfig, ... }:
{
    config = lib.mkIf osConfig.hm.flyxx.mods.syncthing.enable {
        services.syncthing = {
            enable = true;
        };
    };
}
