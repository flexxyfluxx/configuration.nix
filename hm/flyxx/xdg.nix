{ lib, config, osConfig, pkgs, ... }:
let
    cfg = osConfig.hm.flyxx.mods;
in {
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
