{ config, lib, pkgs, ... }:
let
    cfg = config.mods.nix-ld;
in {
    options.mods.nix-ld = {
        enable = lib.mkEnableOption "enable nix-ld";
    };
    config = lib.mkIf cfg.enable {
        programs.nix-ld = {
            enable = true;
            libraries = with pkgs; [
                SDL2
                alsa-lib
                cairo
                expat
                fontconfig
                gdk-pixbuf
                glib
                gtk3
                libGL
                libgcc.lib
                libsoup_3
                libxext
                libxrender
                pango
                tcl
                tclPackages.tk
                webkitgtk_4_1
                xorg.libX11
                xorg.libXft
            ];
        };
    };
}
