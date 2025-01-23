{ lib, config, ... }:
let
    cfg = config.mods.cli;
in {
    imports = [
        ./nvim
        ./shell.nix
        ./shellutils.nix
    ];
    options.mods.cli = {
        defaults.enable = lib.mkEnableOption "enable standard cli apps" // { default = true; };
    };
    config = lib.mkIf cfg.defaults.enable {
        mods.cli.shell.enable = lib.mkDefault true;
        mods.cli.nvim.enable = lib.mkDefault true;
    };
}
