{ lib, ... }:
{
    # HACK: maybe theres a better place to do this.
    #       but also it doesnt rlly make sense to make a global module,
    #       since literally only my desktop is even capable of caring about this opt
    options = {
        enableHDD = lib.mkEnableOption "whether to even attempt to mount the HDD automatically";
    };

    config = {
        time.timeZone = "Europe/Berlin";

        mods = {
            bleedingedge    .enable = true;
            cli.shellutils  .enable = true;
            clipboard.wl    .enable = true;
            # INFO: Docker originally enabled globally for fucky Rust cross-compile reasons
            dockerd         .enable = true;
            gaming          .enable = true;
            git             .enable = true;
            # gnunet          .enable = true;
            networkmanager  .enable = true;  # whytf not
            ntfs3g          .enable = true;
            printing        .enable = true;
            input = {
                ratbagd     .enable = true;
            };
            users.flyxx     .enable = true;
            users.neon      .enable = true;
            vm = {
                enable              = true;  # this formatting is something
                vfio-pci-ids = [
                    "1002:164e"
                ];
            };
            wireless = {
                bluetooth   .enable = true;
            };
            xdg-portal      .enable = true;
        };
        hm = {
            enable = true;
            flyxx = {
                enable = true;
                mods = {
                    desktopApps = {
                        defaults        .enable = true;
                        krita           .enable = true;
                        nheko           .enable = false;
                        piper           .enable = true;
                        signal          .enable = true;
                        tidal           .enable = true;
                    };
                    # INFO: mail module removed because my emails and passwords and shit were just in plaintext on github :|
                    # mail                .enable = true;
                    notifs              .enable = true;
                    sway                .enable = true;
                    syncthing           .enable = true;
                    swaylock            .enable = true;
                    waybar = {
                        enable = true;
                        cpu-count = 16;
                    };
                    # xdg-portal.enable = true;
                };
            };

            neon = {
                enable = true;
                mods = {
                    desktopApps = {
                        defaults        .enable = true;
                        signal          .enable = true;
                    };
                    notifs              .enable = true;
                    sway                .enable = true;
                    swaylock            .enable = true;
                    waybar = {
                        enable = true;
                        cpu-count = 16;
                    };
                    # xdg-portal.enable = true;
                };
            };
        };

        enableHDD = false;

        # networking.wireless = {
        #     enable = true;
        #     networks = {
        #
        #     };
        # };

        # something something, do not change this ever, unless you know what you're doing
        # ig my desktop inherits this as well.
        system.stateVersion = "23.11";
    };
}
