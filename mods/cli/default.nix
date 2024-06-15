{ lib, config, ... }:
{
    imports = [
        ./nvim
        ./shell.nix
        ./shellutils.nix
    ];
    options.mods = {
        cli.defaults.enable = lib.mkEnableOption "enable standard cli apps" // {
            default = true;
        };
    };
    config = lib.mkIf config.mods.cli.defaults.enable {
        mods.cli.shell.enable = lib.mkDefault true;
        mods.cli.nvim.enable = lib.mkDefault true;
    };
}
