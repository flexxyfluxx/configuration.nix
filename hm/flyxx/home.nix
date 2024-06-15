{ lib, config, pkgs, ... }:
{
    home = {
        stateVersion = "24.05";
        username = "flyxx";
        homeDirectory = "/home/flyxx";

        packages = with pkgs; [
            vesktop
            element-desktop
            vlc
            alsa-utils
            logisim-evolution
            jetbrains.pycharm-professional
            bc
        ];
    };
}
