{ lib, config, osConfig, pkgs, ... }:
{
    config = lib.mkIf osConfig.hm.flyxx.mods.desktopApps.libreoffice.enable {
        home.packages = with pkgs; [ libreoffice-qt ];
    };
}
