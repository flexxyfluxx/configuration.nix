{ pkgs, lib, config, ... }:
{
    options.mods = {
        cli.shellutils.enable = lib.mkEnableOption "enable various shell utils";
    };
    config = lib.mkIf config.mods.cli.shellutils.enable {
        environment.systemPackages = with pkgs; [
            bat
            blahaj
            btop
            curl
            eza
            fend
            fzf
            gay
            killall
            make
            ncdu
            neofetch
            nix-output-monitor
            p7zip
            screen
            tree
            uwufetch
            vim
            wget
        ];
    };
}
