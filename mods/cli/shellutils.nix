{ pkgs, lib, config, ... }:
{
    options.mods = {
        cli.shellUtils.enable = lib.mkEnableOption "enable various shell utils";
    };
    config = lib.mkIf config.mods.cli.shellUtils.enable {
        environment.systemPackages = with pkgs; [
            tree
            eza

            bat
            htop
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
        ];
    };
}
