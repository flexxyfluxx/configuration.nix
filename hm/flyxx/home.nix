{ lib, config, pkgs, ... }:
{
    config = {
        home = {
            stateVersion = "24.05";
            username = "flyxx";
            homeDirectory = "/home/flyxx";

            packages = with pkgs; [
                alsa-utils
                bc
                jetbrains.idea-ultimate
                jetbrains.pycharm-professional
                logisim-evolution
                prismlauncher
                vesktop
                vlc
                # no more element. i have nheko now
                # element-desktop
            ];
        };
    };
}
