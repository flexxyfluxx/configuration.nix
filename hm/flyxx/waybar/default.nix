{ lib, config, ... }:
{
    options = {
        hm.mods.waybar.enable = lib.mkEnableOption "enable waybar" // {
            default = true;  # FIXME: figure out hm options
        };
    };
    config = lib.mkIf config.hm.mods.waybar.enable {
        programs.waybar = {
            enable = true;
            systemd.enable = true;

            settings = {
                mainBar = import ./mainBar.nix;
            };
            style = builtins.readFile ./styles/dark.css;
        };
    };
}
