{ lib, config, ... }:
let
    cfg = config.mods;
in {
    options.mods = {
        printing.enable = lib.mkEnableOption "enable printing";
    };
    config = lib.mkIf cfg.printing.enable {
        services.printing.enable = true;

        # INFO: for network discovery of printers.
        #       there may be a better way, but this seems to be the best option without hardcoding printers
        services.avahi = {
            enable = true;
            nssmdns4 = true;
            openFirewall = true;
        };
    };
}
