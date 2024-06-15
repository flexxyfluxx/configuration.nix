{ lib, config, ... }:
{
    options.mods = {
        polkit.enable = lib.mkEnableOption "enable polkit" // {
            default = true;
        };
    };
    config = lib.mkIf config.mods.polkit.enable {
        security.polkit.enable = true;
    };
}
