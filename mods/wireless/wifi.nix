{ lib, config, ... }:
{
    options.mods.wireless = {
        wifi.enable = lib.mkEnableOption "enable wifi capabilities";
    };
    config = lib.mkIf config.mods.wireless.wifi.enable {
        networking.networkmanager.enable = true;
        programs.nm-applet.enable = true;
    };
}
