{ pkgs, lib, config, ... }:
{
    options.mods = {
        extraFonts.enable = lib.mkEnableOption "enable extra fonts" // {
            default = true;
        };
    };
    config = lib.mkIf config.mods.extraFonts.enable {
        fonts.packages = with pkgs; [
            noto-fonts
            jetbrains-mono
            nerdfonts
        ];
    };
}

