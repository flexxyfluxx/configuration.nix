{
    config = {
        time.timeZone = "Europe/Berlin";

        mods = {
            cli.shellutils.enable   = true;
            git.enable              = true;
            laptop-utils.enable     = true;
            printing.enable         = true;
            users.flyxx.enable      = true;
            clipboard.wl.enable     = true;
        };
        hm = {
            enable = true;
            users.flyxx.enable = true;
        };

        # something something, do not change this ever, unless you know what you're doing
        system.stateVersion = 23.11;
    };
}
