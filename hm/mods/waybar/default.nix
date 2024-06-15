{ lib, config, ... }:
{
    options = {
        mods-hm.waybar.enable = lib.mkEnableOption "enable waybar" // {
            default = config.mods-hm.sway.enable;
        };
    };
    config = lib.mkIf config.mods-hm.waybar.enable {
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
