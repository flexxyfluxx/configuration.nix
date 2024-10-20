{ lib, config, pkgs, ... }:
{
    options.hm = {
        flyxx.enable = lib.mkEnableOption "enable HM config of user flyxx";
        flyxx.mods = rec {
            # HACK: For some reason, I can't use recursive functionality. It just type-errors. It shouldn't type-error.
            # desktopApps = {
            desktopApps = let cfg = config.hm.flyxx.mods.desktopApps; in {
                defaults.enable = lib.mkEnableOption "enable default desktop apps";
                kitty.enable = lib.mkEnableOption "enable kitty" // { default = cfg.defaults.enable; };
                librewolf.enable = lib.mkEnableOption "enable librewolf" // { default = cfg.defaults.enable; };
                thunderbird.enable = lib.mkEnableOption "enable thunderbird" // { default = cfg.defaults.enable; };
                # INFO: nheko currently disabled due to being marked as insecure thanks to libolm deprecation etc
                nheko.enable = lib.mkEnableOption "enable nheko"; #// { default = cfg.defaults.enable; };
                tidal.enable = lib.mkEnableOption "enable tidal";  # not a default-kinda module
            };
            sway = {
                enable = lib.mkEnableOption "enable sway"; #// { default = true; };
                config = {
                    launcher = lib.mkOption {
                        description = "app launcher config";
                        default = "${pkgs.bemenu}/bin/bemenu-run --fn 'JetBrainsMono Nerd Font Regular 11'";
                    };
                };
            };
            waybar = {
                enable = lib.mkEnableOption "enable waybar"; #// { default = true; };
                cpu-count = lib.mkOption {
                    description = "CPU core count to display";
                };
            };
            swaylock.enable = lib.mkEnableOption "enable swaylock" // { default = sway.enable; };
            xdg-portal.enable = lib.mkEnableOption "enable xdg-portal (for screen sharing)"; #// { default = true;
            mail.enable = lib.mkEnableOption "enable mail";
            notifs.enable = lib.mkEnableOption "enable notification widget" // { default = sway.enable; };
        };
    };
    config = lib.mkIf config.hm.flyxx.enable {
        home-manager.users."flyxx" = {
            imports = [
                ./desktopApps
                ./home.nix
                ./mail.nix
                ./notifs.nix
                ./sway
                ./swaylock.nix
                ./waybar
            ];
        };
    };
}
