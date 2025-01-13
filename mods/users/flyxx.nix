{ lib, config, ... }:
let
    cfg = config.mods.users;
in {
    options.mods.users = {
        flyxx.enable = lib.mkEnableOption "enable flyxx user";
    };
    config = lib.mkIf cfg.flyxx.enable {
        users.users."flyxx" = {
            isNormalUser = true;
            extraGroups = [
                "wheel"
                "dialout"  # so i can actually write to my fucking arduino
            ]   ++ (if config.mods.networkmanager.enable then [ "networkmanager" ] else [])
                ++ (if config.mods.gnunet.enable then [ "gnunet" ] else [])
                ++ (if config.mods.vm.enable then [ "libvirt" "kvm" ] else [])
            ;
        };
        security.pam.services."flyxx".enableGnomeKeyring = true;
        services.gnome.gnome-keyring.enable = true;
    };
}
