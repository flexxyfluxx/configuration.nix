{ lib, config, pkgs, ... }:
let cfg = config.mods.clipboard;
in {
    options.mods = {
        clipboard = {
            wl.enable = lib.mkEnableOption "enable wl clipboard";
            xorg.enable = lib.mkEnableOption "enable xorg clipboard";
        };
    };
    config = {
        environment.systemPackages = [
            (lib.mkIf cfg.wl.enable pkgs.wl-clipboard)
            (lib.mkIf cfg.xorg.enable pkgs.xclip)
        ];
    };
}
