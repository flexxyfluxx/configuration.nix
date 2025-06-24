{ pkgs, lib, config, osConfig, ... }:
{
    config = lib.mkIf osConfig.hm.flyxx.mods.tex.enable {
        programs.texlive = {
            enable = true;
        };
        home.packages = with pkgs; [
            texstudio
        ];
    };
}
