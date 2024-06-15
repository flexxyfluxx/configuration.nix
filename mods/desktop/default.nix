{ lib, config, ... }:
{
    imports = [
    ];
    options = {
    };
    config = lib.mkIf config.stddesktop.enable {
    };
}
