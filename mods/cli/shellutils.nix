{ pkgs, lib, config, ... }:
let
    cfg = config.mods.cli.shellutils;
in {
    options.mods.cli.shellutils = {
        enable = lib.mkEnableOption "enable various shell utils";
        calc = lib.mkEnableOption "enable Fend terminal calculator" // { default = true; };
    };
    config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            tree
            eza
            ncdu

            bat
            btop
            fzf

            wget
            curl
            p7zip

            nix-output-monitor

            neofetch
            blahaj
            uwufetch
            gay

            vim
        ]   ++ (if cfg.calc.enable then [ fend ] else []);
    };
}
