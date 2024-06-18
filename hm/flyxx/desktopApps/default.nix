{ lib, config, ... }:
let cfg = config.hm.mods;
in {
    imports = [
        ./librewolf.nix
        ./kitty.nix
        ./thunderbird.nix
    ];
    options.hm.mods = {
        desktopApps.defaults.enable = lib.mkEnableOption "enable default desktop apps" // {
            default = true;
        };
    };
    config = lib.mkIf cfg.desktopApps.defaults.enable {
        hm.mods.desktopApps = {
            librewolf.enable = lib.mkDefault true;
            kitty.enable = lib.mkDefault true;
            thunderbird.enable = lib.mkDefault config.hm.mods.mail.enable;
        };
    };
}
