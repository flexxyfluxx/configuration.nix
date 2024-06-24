{ lib, config, osConfig, ... }:
let
    _mkCpuIconString = acc: count: if count <= 0
                                   then acc
                                   else _mkCpuIconString ("{icon${toString (count - 1)}}" + acc) (count - 1);
    mkCpuIconString = _mkCpuIconString "";
in {
    config = lib.mkIf osConfig.hm.flyxx.mods.waybar.enable {
        programs.waybar = {
            enable = true;
            systemd.enable = true;

            settings = {
                mainBar = import ./mainBar.nix {
                    cpu-count = osConfig.hm.flyxx.mods.waybar.cpu-count;
                    inherit mkCpuIconString;
                };
            };
            style = builtins.readFile ./styles/dark.css;
        };
    };
}
