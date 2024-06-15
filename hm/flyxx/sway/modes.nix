{
    config.modes = let
        mod = "Mod4";
        left  = "h";
        down  = "j";
        up    = "k";
        right = "l";
    in {
        resize = {
            "${left}"  = "resize shrink width 10px";
            "${down}"  = "resize shrink height 10px";
            "${up}"    = "resize grow height 10px";
            "${right}" = "resize grow width 10px";
            "Escape"   = "mode default";
            "Return"   = "mode default";
            "${mod}+r" = "mode default";
        };
    };
}
