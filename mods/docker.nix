{ config, lib, ... }:
let
    cfg = config.mods.dockerd;
in {
    options.mods = {
        dockerd.enable = lib.mkEnableOption "enable docker daemon";
    };
    config = lib.mkIf cfg.enable {
        virtualisation.docker.enable = true;
    };
}
