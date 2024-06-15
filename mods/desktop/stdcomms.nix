{ lib, config, ... }:
{
    options = {
        desktop.stdcomms.enable = lib.mkEnableOption "enable standard communication apps (vesktop, element)";
    };
    config = lib.mkIf config.desktop.stdcomms.enable {
        
    };
}
