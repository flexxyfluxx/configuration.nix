{ lib, config, ... }:
let cfg = config.hm.mods;
in {
    imports = [
        ./librewolf.nix
        ./kitty.nix
        ./thunderbird.nix
    ];
    options.hm.mods = {
        desktopApps.defaults.enable = lib.mkEnableOption "enable default desktop apps";
    };
    config = lib.mkIf cfg.desktopApps.defaults.enable {
        hm.mods.desktopApps = {
            librewolf.enable = lib.mkOptionDefault true;
            kitty.enable = lib.mkOptionDefault true;
            thunderbird.enable = lib.mkOptionDefault config.hm.mods.mail.enable;
        };
    };
}
