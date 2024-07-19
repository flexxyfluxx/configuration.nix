{ lib, config, ... }:
{
    options.mods = {
        grub.enable = lib.mkEnableOption "enable GRUB" // {
            default = true;
        };
    };
    config = lib.mkIf config.mods.grub.enable {
        boot.loader.efi.canTouchEfiVariables = true;
        boot.loader.grub = {
            enable = true;
            efiSupport = true;
            device = "nodev";
            useOSProber = true;
            configurationLimit = 32;
        };
        boot.tmp.cleanOnBoot = true;
    };
}
