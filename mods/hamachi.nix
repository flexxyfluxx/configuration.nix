{ lib, config, pkgs, ... }:
let cfg = config.mods.hamachi;
in {
    options.mods = {
        hamachi.enable = lib.mkEnableOption "enable hamachi";
    };
    config = {
        programs.haguichi.enable = true;
    };
}
