{ lib, config, osConfig, pkgs, ... }:
{
    config = lib.mkIf osConfig.hm.flyxx.mods.desktopApps.kitty.enable {
        programs.kitty = {
            enable = true;
            shellIntegration.enableZshIntegration = true;
            #theme = "1984 Orwellian";
            font = {
                package = pkgs.jetbrains-mono;
                name = "JetBrains Mono";
                size = 13;
            };
            keybindings = {
                "ctrl+shift+enter" = "new_os_window_with_cwd";
                "ctrl+shift+n" = "new_window";
                "ctrl+shift+q" = "close_window";
                "ctrl+shift+w" = "nop";
            };
            settings = {
                disable_ligatures = "cursor";

                background_opacity = "0.9";
                cursor_shape = "beam";
                enable_audio_bell = "false";

                # set pure black background
                #background = "#000000";
            };
        };
        programs.zsh.enable = true; # because the way HM does kitty shell integration fucking sucks
    };
}

