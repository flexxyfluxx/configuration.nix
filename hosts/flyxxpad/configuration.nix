{ config, pkgs, inputs, ... }:
{
    imports = [
        # inputs.sops-nix.nixosModules.sops
    ];
    config = {
        time.timeZone = "Europe/Berlin";

        mods = {
            cli.shellutils.enable   = true;
            git.enable              = true;
            laptop-utils.enable     = true;
            printing.enable         = true;
            users.flyxx.enable      = true;
            clipboard.wl.enable     = true;
            wireless = {
                # wifi.enable         = true;
                bluetooth.enable    = true;
            };
            networkmanager.enable = true;
        };
        hm = {
            enable = true;
            users.flyxx.enable = true;
        };

        networking.networkmanager.unmanaged = [ "enp2s0" ];

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
