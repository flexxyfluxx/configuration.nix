{ lib, config, pkgs, ... }:
{
    options.mods.cli = {
        nvim.enable = lib.mkEnableOption "enable nvim";
    };
    config = lib.mkIf config.mods.cli.nvim.enable {
        programs.nixvim = {
            enable = true;
            clipboard.providers.wl-copy.enable = true; # Enable the wayland clipboard

            extraPlugins = with pkgs.vimPlugins; [
                # feline
                harpoon2
            ];
        }   // import ./colorschemes.nix
            // import ./keymaps.nix
            // import ./opts.nix
            // import ./plugins
        ;
    };
}
