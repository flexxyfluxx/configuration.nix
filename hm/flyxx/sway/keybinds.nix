{ pkgs, launcher, wpctl, brightnessctl, console, ... }:
let
    mod = "Mod4";
    left  = "h";
    down  = "j";
    up    = "k";
    right = "l";
    config-edit = "${console} -d /etc/nixos sudo nvim .";
in {
    #modifier = mod;
    floating.modifier = mod;
    keybindings = {
        # General stuff
        "${mod}+Shift+q" = "kill";

        # signout
        "${mod}+Shift+Delete" = "exec swaynag -t warning -m 'confirm sesssion exit' -B 'yes' 'swaymsg exit'";

        # Applications
        "${mod}+Return" = "exec ${console}"; # Terminal
        "${mod}+d"      = "exec ${launcher}"; # bemenu

        "${mod}+${left}"  = "focus left";
        "${mod}+${down}"  = "focus down";
        "${mod}+${up}"    = "focus up";
        "${mod}+${right}" = "focus right";

        "${mod}+Shift+${left}"  = "move left";
        "${mod}+Shift+${down}"  = "move down";
        "${mod}+Shift+${up}"    = "move up";
        "${mod}+Shift+${right}" = "move right";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

        "${mod}+Control+Shift+${left}"  = "move workspace to output left";
        "${mod}+Control+Shift+${right}" = "move workspace to output right";
        "${mod}+Control+Shift+${up}"    = "move workspace to output up";
        "${mod}+Control+Shift+${down}"  = "move workspace to output down";

        "${mod}+b" = "splith";
        "${mod}+v" = "splitv";

        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";

        "${mod}+space" = "focus mode_toggle";
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+a" = "focus parent";

        "${mod}+f" = "fullscreen";

        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";

        # config edit hotkey, because why the actual fuck not
        "${mod}+Control+c" = "exec ${config-edit}";

        # display brightness things
        "XF86MonBrightnessUp" = "exec --no-startup-id ${brightnessctl} s 15+";
        "XF86MonBrightnessDown" = "exec --no-startup-id ${brightnessctl} s 15-";

        # audio volume control
        "XF86AudioRaiseVolume" = "exec --no-startup-id ${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec --no-startup-id ${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute"        = "exec --no-startup-id ${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle";

        # screenshot UwU
        "${mod}+p" = "exec ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | ${pkgs.wl-clipboard}/bin/wl-copy";

        # resizing
        "${mod}+r" = "mode resize";
    };
}
