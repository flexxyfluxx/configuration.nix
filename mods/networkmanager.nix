{ lib, config, ... }:
{
    options.mods = {
        networkmanager.enable = lib.mkEnableOption "enable networking";
    };
    config = lib.mkIf config.mods.networkmanager.enable {
        networking.networkmanager.enable = true;
        programs.nmcli.enable = true;
    };
}
