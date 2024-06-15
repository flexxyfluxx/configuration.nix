{ lib, config, ... }:
let
    cfg = config.mods;
in {
    options.mods = {
        ssh.enable = lib.mkEnableOption "enable ssh" // {
            default = true;
        };
    };
    config = lib.mkIf cfg.ssh.enable {
        services.openssh.enable = true;
    };
}
