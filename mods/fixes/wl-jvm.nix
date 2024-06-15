{
    config = {
        environment.extraInit = ''
            if [ "$XDG_SESSION_TYPE" = "sway"]; then
                export _JAVA_AWT_WM_NONREPARENTING=1
            fi
            '';
    };
}
