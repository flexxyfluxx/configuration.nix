{ lib, config, pkgs, ... }:
{
    options.mods = {
        gnunet.enable = lib.mkEnableOption "enable gnunet utils";
    };
    config = lib.mkIf config.mods.gnunet.enable {
        services.gnunet.enable = true;
    };
}
