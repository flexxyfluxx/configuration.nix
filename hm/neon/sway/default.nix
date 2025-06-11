{ lib, config, osConfig, pkgs, ... }:
{
    config = lib.mkIf osConfig.hm.neon.mods.sway.enable {
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
                    "1133:16511:Logitech_G502" = {
                        accel_profile = "flat";
                        pointer_accel = "-0.85";
                    };
                };

                output = {
                    "*" = {
                        #bg = let img = ./wallpaper/d2016_runetrials.jpg;
                        bg = let img = ./wallpaper/trans_splat_darkened.jpg;
                        in "${img} fill";
                    };
                    "DP-3" = {
                        resolution = "2560x1440";
                        position = "0,0";
                    };
                    "HDMI-A-1" = {
                        resolution = "1920x1080";
                        position = "2560,360";
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
                        launcher = "${osConfig.hm.neon.mods.sway.config.launcher}";
                        # launcher = "${pkgs.bemenu}/bin/bemenu-run --fn 'JetBrainsMono Nerd Font Regular 11'";
                        console = "kitty";
                        inherit pkgs;
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
