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
            ntfs3g.enable           = true;
        };
        hm = {
            enable = true;
            flyxx = {
                enable = true;
                mods = {
                    desktopApps.defaults.enable = true;
                    sway.enable = true;
                    waybar = {
                        enable = true;
                        cpu-count = 16;
                    };
                    swaylock.enable = true;
                    xdg-portal.enable = true;
                    mail.enable = true;
                    notifs.enable = true;
                };
            };
        };

        # something something, do not change this ever, unless you know what you're doing
        # ig my desktop inherits this as well.
        system.stateVersion = "23.11";
    };
}
