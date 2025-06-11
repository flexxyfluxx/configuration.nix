{ lib, config, ... }:
let
    cfg = config.mods.users;
in {
    options.mods.users = {
        neon.enable = lib.mkEnableOption "enable neon user";
    };
    config = lib.mkIf cfg.flyxx.enable {
        users.users."neon" = {
            isNormalUser = true;
            extraGroups = [
                "wheel"
                "dialout"  # so i can actually write to my fucking arduino
            ]   ++ (if config.mods.networkmanager.enable then [ "networkmanager" ] else [])
                ++ (if config.mods.gnunet.enable then [ "gnunet" ] else [])
                ++ (if config.mods.vm.enable then [ "libvirtd" "input" "kvm" "qemu-libvirtd" ] else [])
                ++ (if config.mods.dockerd.enable then [ "docker" ] else [])
                ++ (if config.mods.input.ratbagd.enable then [ "ratbagd" "libratbag" ] else [])
            ;
        };
        security.pam.services."neon".enableGnomeKeyring = true;
        services.gnome.gnome-keyring.enable = true;
    };
}
