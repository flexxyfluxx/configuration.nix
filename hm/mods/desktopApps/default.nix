{ lib, config, ... }:
{
    imports = [
        ./librewolf.nix
        ./kitty.nix
        ./thunderbird.nix
    ];
    options = {
        mods-hm.desktopApps.defaults.enable = lib.mkEnableOption "enable default desktop apps";
    };
    config = lib.mkIf config.mods-hm.desktopApps.defaults.enable {
        mods-hm.desktopApps = {
            librewolf.enable = lib.mkOptionDefault true;
            kitty.enable = lib.mkOptionDefault true;
            thunderbird.enable = lib.mkOptionDefault config.mods-hm.mail.enable;
        };
    };
}
