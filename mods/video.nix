{ lib, config, ... }:
let cfg = config.mods;
in {
    options.mods = {
        video.enable = lib.mkEnableOption "enable video drivers" // {
            default = true;
        };
    };
    config = lib.mkIf cfg.video.enable {
        hardware.opengl = {
            enable = true;
            driSupport = true;
        };
    };
}
