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
                syncthing
                vesktop
                vlc
            ];
            sessionVariables = {
                "XDG_PICTURES_DIR" = "$HOME/Pictures";
                "XDG_SCREENSHOTS_DIR" = "$HOME/Pictures/Screenshots";
                "XDG_DOCUMENTS_DIR" = "$HOME/Documents";
                "XDG_DOWNLOAD_DIR" = "$HOME/Downloads";
                "XDG_MUSIC_DIR" = "$HOME/Music";
                "XDG_VIDEOS_DIR" = "$HOME/Videos";
                # "XDG_PUBLICSHARE_DIR" = "$HOME/Public";
                # "XDG_TEMPLATES_DIR" = "$HOME/Templates";
            };
        };
    };
}
