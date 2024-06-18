{ lib, config, pkgs, ... }:
{
    options.hm.mods = {
        sway = {
            enable = lib.mkEnableOption "enable sway" // {
                default = true;  # FIXME: figure out hm options
            };
            config = {
                launcher = lib.mkOption {
                    description = "app launcher config";
                    default = "${pkgs.bemenu}/bin/bemenu-run --fn 'JetBrainsMono Nerd Font Regular 11'";
                };
            };
        };
    };

    config = lib.mkIf config.hm.mods.sway.enable {
        home.packages = with pkgs; [ swaybg ];
        wayland.windowManager.sway = {
            enable = true;
            config = {
                input = {
                    "*" = {
                        xkb_layout = "de";
                    };
                    "type:touchpad" = {
                        tap = "enabled";
                        natural_scroll = "enabled";
                    };
                };

                output = {
                    "*" = {
                        /*
                        #bg = let img = /etc/nixos/wallpaper/d2016_runetrials.jpg;
                        bg = let img = /etc/nixos/wallpaper/trans_splat_darkened.jpg;
                        in "${img} fill";
                        */
                    };
                };

                bars = [
                    /*
                    (lib.mkIf (config.hm.mods.waybar.enable == false) {
                        output = "eDP-1";
                        fonts = {
                            names = [ "JetBrains Mono" ];
                            style = "Regular";
                            size = 8.0;
                        };
                    })
                    */
                ];

            }   // import ./modes.nix
                // import ./colors.nix
                // import ./keybinds.nix {
                        wpctl = "${pkgs.wireplumber}/bin/wpctl";
                        brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
                        # FIXME: figure out hm options
                        # launcher = "${config.hm.sway.config.launcher}";
                        launcher = "${pkgs.bemenu}/bin/bemenu-run --fn 'JetBrainsMono Nerd Font Regular 11'";
                        console = "kitty";
                    }
            ;

            wrapperFeatures.gtk = true;

            # this is bc nix inserts config options into the actual resulting config in alphabetical
            # order, leading to the default workspace being 10 if i dont do the following:
            # (switch to workspace 1 immediately upon loading the config)
            # (funnily enough, this bit of config does not reapply when refreshing sway.
            # i suppose that's for the better)
            extraConfig = ''
                workspace number 1
                '';
        };
    };
}
