{ lib, config, pkgs, ... }:
{
    options.mods = {
        greetd.enable = lib.mkEnableOption "enable greetd" // {
            default = true;
        };
    };
    config = lib.mkIf config.mods.greetd.enable {
        services.greetd = {
            enable = true;
            settings = {
                default_session = {
                    command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --asterisks --width 60 --cmd sway --greeting 'Login'";
                };
            };
        };

        systemd.services.greetd.serviceConfig = {
            Type = "idle";
            StandardInput = "tty";
            StandardOutput = "tty";
            StandardError = "journal";
            TTYReset = true;
            TTYVHangup = true;
            TTYVTDisallocate = true;
        };
    };
}
