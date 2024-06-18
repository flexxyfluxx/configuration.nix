{ lib, config, ... }:
{
    options.mods.wireless = {
        bluetooth.enable = lib.mkEnableOption "enable bluetooth capabilities";
    };
    config = lib.mkIf config.mods.wireless.bluetooth.enable {
        hardware.bluetooth.enable = true;
    };
}
