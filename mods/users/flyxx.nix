{ lib, config, ... }:
let cfg = config.mods.users;
in {
    options.mods.users = {
        flyxx.enable = lib.mkEnableOption "enable flyxx user";
    };
    config = lib.mkIf cfg.flyxx.enable {
        users.users."flyxx" = {
            isNormalUser = true;
            extraGroups = [ "wheel" ]
                ++ lib.optional config.networking.networkmanager.enable "networkmanager";
        };
        security.pam.services."flyxx".enableGnomeKeyring = true;
        services.gnome.gnome-keyring.enable = true;
    };
}
