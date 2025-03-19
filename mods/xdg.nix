{ lib, config, pkgs, ... }:
{
    options.mods = {
        xdg-portal.enable = lib.mkEnableOption "enable xdg desktop portal for screen sharing etc";
    };
    config = lib.mkIf config.mods.xdg-portal.enable {
        xdg.portal = {
            enable = true;
            wlr.enable = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal-wlr
                xdg-desktop-portal-gtk
            ];
            config = {
                common.default = [
                    "gtk"
                ];
                wlr.default = [
                    "wlr"
                    "gtk"
                ];
            };
        };
    };
}
