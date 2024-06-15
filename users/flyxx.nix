{ lib, config, ... }:
{
    options = {
        users.flyxx.enable = lib.mkEnableOption "enable user flyxx";
    };
    config = lib.mkIf config.users.flyxx.enable {
        mods-hm.defaults.enable = true;
    };
}
