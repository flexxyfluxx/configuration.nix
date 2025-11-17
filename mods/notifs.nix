{ lib, config, pkgs, ... }:
let
    cfg = config.mods.notifs;
in {
    options.mods.notifs = {
        enable = lib.mkEnableOption "enable libnotify" // { default = true; };
    };
    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            libnotify
        ];
    };
}
