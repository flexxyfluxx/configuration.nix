{ lib, config, pkgs, ... }:
let cfg = config.mods.vpn;
in {
    options.mods = {
        vpn.enable = lib.mkEnableOption "enable vpn";
    };
    config = {
        programs.haguichi.enable = true;
    };
}
