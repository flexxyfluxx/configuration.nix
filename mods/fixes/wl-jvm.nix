{
    config = {
        environment.extraInit = ''
            if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
                export _JAVA_AWT_WM_NONREPARENTING=1
            fi
            '';
    };
}
