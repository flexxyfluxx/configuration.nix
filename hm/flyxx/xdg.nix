{ lib, config, pkgs, ... }:
let
    cfg = config.hm.mods;
in {
    options.hm.mods = {
        xdg-portal.enable = lib.mkEnableOption "enable xdg-portal (for screen sharing)" // {
            default = true; # FIXME: figure out hm options
        };
    };
    config = lib.mkIf cfg.xdg-portal.enable {
        # FIXME: currently doesnt work
        # maybe enable system-wide?
        xdg.portal = {
            enable = true;
            extraPortals = with pkgs; [
                xdg-desktop-portal-wlr
            ];
            config.common.default = [ "gtk" ];
        };
    };
}
