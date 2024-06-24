{ lib, config, ... }:
{
    options.mods = {
        keyring.enable = lib.mkEnableOption "enable credential management keyring";
    };
    config = lib.mkIf config.mods.keyring.enable {
        services.gnome.gnome-keyring.enable = true;
    };
}
