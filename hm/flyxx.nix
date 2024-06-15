{ lib, config, ... }:
{
    config = lib.mkIf config.users.flyxx.enable {
    };
}
