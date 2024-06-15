{ lib, config, ... }:
{
    imports = [
        ./desktopApps
        ./sway
        ./waybar
        ./swaylock
        ./mail.nix
    ];
    options = {
        mods-hm.defaults.enable = lib.mkEnableOption "enable certain defaults";
    };
    config = lib.mkIf config.mods-hm.defaults.enable {
        mods-hm = {
            sway.enable = lib.mkOptionDefault true;
            desktopApps.enable = lib.mkOptionDefault true;
            mail.enable = lib.mkOptionDefault true;
        };
    };
}
