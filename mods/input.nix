{ lib, config, ... }:
let
    cfg = config.mods.input;
in {
    options.mods.input = {
        keymap = lib.mkOption {
            description = "which keymap";
            default = "de-latin1";
        };
        ratbagd.enable = lib.mkEnableOption "enable ratbagd";
    };
    config = {
        console = {
            font = "Lat2-Terminus16";
            keyMap = "${cfg.keymap}";
        };
        services.ratbagd.enable = cfg.ratbagd.enable;
    };
}
