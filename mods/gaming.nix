{ lib, config, ... }:
{
    options.mods = {
        gaming.enable = lib.mkEnableOption "enable gaming things";
    };
    config = lib.mkIf config.mods.gaming.enable {
        programs.steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
        };
        programs.gamemode.enable = true;
    };
}
