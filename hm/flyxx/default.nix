{ lib, config, pkgs, ... }:
{
    options.hm = {
        flyxx.enable = lib.mkEnableOption "enable HM config of user flyxx";
        flyxx.mods = {
            desktopApps = let cfg = config.hm.flyxx.mods.desktopApps; in {
                defaults.enable = lib.mkEnableOption "enable default desktop apps"; #// { default = true; };
                kitty.enable = lib.mkEnableOption "enable kitty" // { default = cfg.defaults.enable; };
                librewolf.enable = lib.mkEnableOption "enable librewolf" // { default = cfg.defaults.enable; };
                thunderbird.enable = lib.mkEnableOption "enable thunderbird" // { default = cfg.defaults.enable; };
                nheko.enable = lib.mkEnableOption "enable nheko" // { default = cfg.defaults.enable; };
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
            swaylock.enable = lib.mkEnableOption "enable swaylock"; #// { default = true; };
            xdg-portal.enable = lib.mkEnableOption "enable xdg-portal (for screen sharing)"; #// { default = true;
            mail.enable = lib.mkEnableOption "enable mail";
        };
    };
    config = lib.mkIf config.hm.flyxx.enable {
        home-manager.users."flyxx" = {
            imports = [
                ./desktopApps
                ./sway
                ./waybar
                ./swaylock.nix
                ./mail.nix
                ./home.nix
            ];
        };
    };
}
