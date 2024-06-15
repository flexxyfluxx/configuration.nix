{ lib, config, ... }:
{
    imports = [
        ./shell.nix
        ./shellutils.nix
    ];
    options.mods = {
        cli.defaults.enable = lib.mkEnableOption "enable standard cli apps" // {
            default = true;
        };
    };
    config = lib.mkIf config.mods.cli.defaults.enable {
        cli.shell.enable = lib.mkDefault true;
    };
}
