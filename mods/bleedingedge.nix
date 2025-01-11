{ lib, config, pkgs, ... }:
let cfg = config.mods.bleedingedge;
in {
    options.mods.bleedingedge = {
        enable = lib.mkEnableOption "enable bleeding edge kernel and so on";
    };
    config = lib.mkIf cfg.enable {
        boot.kernelPackages = pkgs.linuxPackages_latest;
    };
}
