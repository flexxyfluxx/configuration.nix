{ pkgs, ... }:
{
    config = {
        time.timeZone = "Europe/Berlin";

        mods = {
            cli.shellutils  .enable = true;
            clipboard.wl    .enable = true;
            gaming          .enable = true;
            git             .enable = true;
            gnunet          .enable = true;
            ntfs3g          .enable = true;
            printing        .enable = true;
            users.flyxx     .enable = true;
            xdg-portal      .enable = true;
        };
        hm = {
            enable = true;
            flyxx = {
                enable = true;
                mods = {
                    desktopApps.defaults.enable = true;
                    desktopApps.tidal   .enable = true;
                    mail                .enable = true;
                    notifs              .enable = true;
                    sway                .enable = true;
                    swaylock            .enable = true;
                    waybar = {
                        enable = true;
                        cpu-count = 16;
                    };
                    xdg-portal.enable = true;
                };
            };
        };

        mountHDD = false;

        networking.wireless = {
            enable = true;
            networks = {

            };
        };

        # something something, do not change this ever, unless you know what you're doing
        # ig my desktop inherits this as well.
        system.stateVersion = "23.11";
    };
}
