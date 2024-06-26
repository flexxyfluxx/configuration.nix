{ lib, config, pkgs, ... }:
{
    options.mods = {
        gaming.enable = lib.mkEnableOption "enable gaming things";
    };
    config = lib.mkIf config.mods.gaming.enable {
        programs.steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            extraCompatPackages = with pkgs; [ proton-ge-bin ];
        };
        programs.gamemode.enable = true;
    };
}
