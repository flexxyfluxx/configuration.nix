{ lib, config, ... }:
let
    cfg = config.mods;
in {
    options.mods = {
        printing.enable = lib.mkEnableOption "enable printing";
    };
    config = lib.mkIf cfg.printing.enable {
        services.printing.enable = true;
    };
}
