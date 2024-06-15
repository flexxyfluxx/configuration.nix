{ lib, config, ... }:
let
    cfg = config.mods-hm;
in {
    options.mods-hm = {
        xdg-portal.enable = lib.mkEnableOption "enable xdg-portal (for screen sharing)" // {
            default = cfg.sway.enable;
        };
    };
    config = lib.mkIf cfg.xdg-portal.enable {

    };
}
