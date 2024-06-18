{
    config = {
        time.timeZone = "Europe/Berlin";

        mods = {
            cli.shellutils.enable   = true;
            git.enable              = true;
            printing.enable         = true;
            users.flyxx.enable      = true;
            clipboard.wl.enable     = true;
            gaming.enable           = true;
        };
        hm = {
            enable = true;
            users.flyxx.enable = true;
        };

        # something something, do not change this ever, unless you know what you're doing
        # ig my desktop inherits this as well.
        system.stateVersion = "23.11";
    };
}
