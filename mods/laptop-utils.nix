{ lib, config, ... }:
{
    options.mods = {
        laptop-utils.enable = lib.mkEnableOption "enable laptop tools";
    };

    config = lib.mkIf config.mods.laptop-utils.enable {
        services.tlp.enable = true;
    };
}
