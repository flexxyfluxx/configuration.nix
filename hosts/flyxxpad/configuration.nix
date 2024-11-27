{ config, pkgs, inputs, ... }:
{
    imports = [
        # inputs.sops-nix.nixosModules.sops
    ];
    config = {
        time.timeZone = "Europe/Berlin";

        mods = {
            cli.shellutils  .enable = true;
            clipboard.wl    .enable = true;
            gaming          .enable = true;
            git             .enable = true;
            laptop-utils    .enable = true;
            networkmanager  .enable = true;
            printing        .enable = true;
            users.flyxx     .enable = true;
            wireless = {
                # wifi.enable         = true;
                bluetooth.enable = true;
            };
        };
        hm = {
            enable = true;
            flyxx = {
                enable = true;
                mods = {
                    desktopApps.defaults.enable = true;
                    swaylock            .enable = true;
                    xdg-portal          .enable = true;
                    mail                .enable = true;
                    notifs              .enable = true;
                    sway                .enable = true;
                    waybar = {
                        enable = true;
                        cpu-count = 8;
                    };
                };
            };
        };

        # networking.networkmanager.unmanaged = [ "enp2s0" ];

        # sops = {
        #     defaultSopsFile = ../../secrets/secrets.yaml;
        #     defaultSopsFormat = "yaml";
        #     # is this truly user-agnostic??
        #     age.keyFile = "/home/flyxx/.config/sops/age/key.txt";
        # };

        # something something, do not change this ever, unless you know what you're doing
        system.stateVersion = "23.11";
    };
}
