{ lib, config, ... }:
{
    options.mods.config = {
        keymap = lib.mkOption {
            description = "which keymap";
            default = "de-latin1";
        };
    };
    config = {
        console = {
            font = "Lat2-Terminus16";
            keyMap = "${config.mods.config.keymap}";
        };
    };
}
