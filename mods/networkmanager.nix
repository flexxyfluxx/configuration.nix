{ lib, config, pkgs, ... }:
{
    options.mods = {
        networkmanager.enable = lib.mkEnableOption "enable networking";
    };
    config = lib.mkIf config.mods.networkmanager.enable {
        networking.networkmanager = {
            enable = true;
            plugins = with pkgs; [ networkmanager-openconnect ];
        };
        programs.nm-applet = {
            enable = true;
            indicator = true;
        };
    };
}
