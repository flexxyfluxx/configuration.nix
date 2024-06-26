{ lib, config, ... }:
{
    imports = [
        ./flyxx
    ];
    options = {
        hm.enable = lib.mkEnableOption "enable home-manager";
    };
    config = lib.mkIf config.hm.enable {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
    };
}
