{ lib, config, ... }:
{
    options.mods = {
        ncmpcpp.enable = lib.mkEnableOption "enable music player";
    };
    config = lib.mkIf config.mods.ncmpcpp.enable {
        #//TODO
    };
}
