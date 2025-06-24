{ pkgs, lib, config, osConfig, ... }:
{
    config = lib.mkIf osConfig.hm.flyxx.mods.latex.enable {
        programs.texlive = {
            enable = true;
        };
        home.packages = with pkgs; [
            texstudio
        ];
    };
}
